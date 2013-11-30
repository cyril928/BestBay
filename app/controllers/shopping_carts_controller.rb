class ShoppingCartsController < ApplicationController
  before_filter :authenticate_user!

  # Update a shopping cart entry based on user entered preference. User can only update quantities and request deletion.
  # Check for simultaneous updates included by rechecking quantity value before save.
  def update_quantity
    @shopping_cart = ShoppingCart.find_by_user_id(current_user.id)
    @shopping_cart_hash = eval(params[:item_hash])
    @counter = 0
    error_msg = ""
    @shopping_cart_hash.each do |item_id, quantity|
      item = Item.find(Integer(item_id))
      if item.quantity < Integer(params[:change_quantity_item_id][@counter])
        error_msg = "Sorry! Only #{item.quantity} of #{item.title} is available at the moment"
      end
      @counter+=1
    end
    @counter = 0
    if error_msg.empty?
      @shopping_cart_hash.each do |item_id, quantity|
        @shopping_cart_hash[item_id.to_s] = Integer(params[:change_quantity_item_id][@counter])
        if !params[:delete_item_id].nil? && (params[:delete_item_id].include? @counter.to_s)
          @shopping_cart_hash.delete(item_id.to_s)
        end
        @counter+=1
      end

      @shopping_cart.item_list = @shopping_cart_hash.to_s
      @shopping_cart.save

      redirect_to @shopping_cart
    else
      redirect_to @shopping_cart, notice: error_msg
    end
  end

  # Adds an item to the user's shopping cart. Retrieve existing cart else create new. Add item to cart, if already
  # present, update quantity. Handle request from 2 possible pages. More elegant solution, will work on later
  def add_to_cart
    @shopping_cart = ShoppingCart.find_by_user_id(current_user.id)
    if @shopping_cart.nil?
      @shopping_cart = ShoppingCart.new({:user_id => current_user.id, :item_list => Hash.new.to_s})
    end
    if params[:item_id].nil?
      @item = Item.find(params[:item][:item_id])
      if current_user.id  == @item.user_id
        redirect_to root_path
      else
        @shopping_cart.item_list = add_to_item_list(@shopping_cart.item_list, params[:item][:item_id], params[:item][:quantity], @item.quantity)
        @shopping_cart.save
        redirect_to @shopping_cart
      end
    else
      @item = Item.find(params[:item_id])
      if current_user.id  == @item.user_id
        redirect_to root_path
      else
        @shopping_cart.item_list = add_to_item_list(@shopping_cart.item_list, params[:item_id], params[:quantity], @item.quantity)
        @shopping_cart.save
        redirect_to @shopping_cart
      end
    end
  end


  # GET /shopping_carts
  # GET /shopping_carts.json
  def index
    @shopping_carts = ShoppingCart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shopping_carts }
    end
  end

  # GET /shopping_carts/1
  # GET /shopping_carts/1.json
  # Check whether accessing own cart. If true retrieve cart. Construct a shopping item list from the saved item id and
  # format it for the view.
  def show
    @shopping_cart = ShoppingCart.find(params[:id])
    if(@shopping_cart.user == current_user)
      @shopping_cart_hash = eval(@shopping_cart.item_list)
      @shopping_item_list = Array.new
      @total_price = 0
      @shopping_cart_hash.each do |item_id, quantity|
        @item = Item.find(Integer(item_id))
        @shopping_item_list += [{:item => @item, :quantity => quantity, :price => (quantity * @item.price)}]
        @total_price += (quantity * @item.price)
      end
      @reward_points = current_user.reward_points > @total_price ? @total_price : current_user.reward_points
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @shopping_cart }
      end
    else
      redirect_to root_path
    end
  end

  # GET /shopping_carts/new
  # GET /shopping_carts/new.json
  def new
    if(ShoppingCart.find_by_user_id(current.user).nil?)
    @shopping_cart = ShoppingCart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shopping_cart }
    end
    else
      redirect_to root_path
    end
  end

  # GET /shopping_carts/1/edit
  def edit
    @shopping_cart = ShoppingCart.find(params[:id])
  end

  # POST /shopping_carts
  # POST /shopping_carts.json
  def create
    @shopping_cart = ShoppingCart.new(params[:shopping_cart])

    respond_to do |format|
      if @shopping_cart.save
        format.html { redirect_to @shopping_cart, notice: 'Shopping cart was successfully created.' }
        format.json { render json: @shopping_cart, status: :created, location: @shopping_cart }
      else
        format.html { render action: "new" }
        format.json { render json: @shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shopping_carts/1
  # PUT /shopping_carts/1.json
  def update
    item_quantities = Array.new
    item_quantities = params[:shopping_cart]
    item_list = Hash.new
    @shopping_cart = ShoppingCart.find(params[:id])
    shopping_cart_hash = eval(@shopping_cart.item_list)
    counter = 0
    shopping_cart_hash.each do |item_id, quantity|
      item_list[item_id] = Integer(item_quantities[counter])
      counter += 1
    end
    params[:shopping_cart] = Hash["item_list" => item_list.to_s]
    respond_to do |format|
      if @shopping_cart.update_attributes(params[:shopping_cart])
        format.html { redirect_to @shopping_cart, notice: 'Shopping cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_carts/1
  # DELETE /shopping_carts/1.json
  def destroy
    @shopping_cart = ShoppingCart.find(params[:id])
    item_list_hash = eval(@shopping_cart.item_list)
    item_list_hash.delete(params[:item_in_cart].to_s)
    @shopping_cart.item_list = item_list_hash.to_s
    @shopping_cart.save

    respond_to do |format|
      format.html { redirect_to @shopping_cart, notice: item_list_hash.to_s }
      format.json { head :no_content }
    end
  end

  # Returns: string version of the shopping list for  the shopping cart
  # Parameters: shopping_list: a list of items in the shopping cart
  # Parameters: item_id: id of the item which is to be added to the shopping list
  # Parameters: quantity: quantity sought for by the buyer
  # Parameters: max_quantity: maximum available quantity for the requested item.
  # Adds an item to the shopping list or if already present increments the quantity. Checks whether order
  # exceeds available quantity, if true then set the quantity to maximum available
  def add_to_item_list(shopping_list, item_id, quantity, max_quantity)

    @shopping_list_hash = eval(shopping_list)
    if @shopping_list_hash.has_key?(item_id)
      @shopping_list_hash[item_id] = [Integer(@shopping_list_hash[item_id]) + Integer(quantity), max_quantity].min
    else
      @shopping_list_hash[item_id] = [Integer(quantity), max_quantity].min
    end
    @shopping_list_hash.to_s

  end

end
