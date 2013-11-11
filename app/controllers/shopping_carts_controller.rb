class ShoppingCartsController < ApplicationController
  include ShoppingCartsHelper
  before_filter :authenticate_user!



  def add_to_cart
     @shopping_cart = ShoppingCart.find_by_user_id(current_user.id)
     if @shopping_cart.nil?
       @shopping_cart = ShoppingCart.new({:user_id => current_user.id, :item_list => Hash.new.to_s})
     end
     if params[:item_id].nil?
       @item = Item.find(params[:item][:item_id])
       @shopping_cart.item_list = add_to_item_list(@shopping_cart.item_list, params[:item][:item_id], params[:item][:quantity], @item.quantity)
     else
       @item = Item.find(params[:item_id])
       @shopping_cart.item_list = add_to_item_list(@shopping_cart.item_list, params[:item_id], params[:quantity], @item.quantity)
          end
       @shopping_cart.save
     redirect_to @shopping_cart
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
  def show
    @shopping_cart = ShoppingCart.find(params[:id])
    @shopping_cart_hash = eval(@shopping_cart.item_list)
    @shopping_item_list = Array.new
    @shopping_cart_hash.each do |item_id, quantity|
      @item = Item.find(Integer(item_id))
      @shopping_item_list += [{:title => @item.title, :quantity => quantity, :price => (quantity * @item.price)}]
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shopping_cart }
    end
  end

  # GET /shopping_carts/new
  # GET /shopping_carts/new.json
  def new
    @shopping_cart = ShoppingCart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shopping_cart }
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

    puts params[:item][:delete_item_id]
=begin
    @shopping_cart_hash = eval(params[:shopping_cart].item_list)
    @shopping_item_list = Array.new
    @shopping_cart_hash.each do |item_id, quantity|
      @item = Item.find(Integer(item_id))
      @shopping_item_list += [{:title => @item.title, :quantity => quantity, :price => (quantity * @item.price)}]
    end
=end


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
    @shopping_cart.destroy

    respond_to do |format|
      format.html { redirect_to shopping_carts_url }
      format.json { head :no_content }
    end
  end
end
