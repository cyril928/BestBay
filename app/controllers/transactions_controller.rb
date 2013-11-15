class TransactionsController < ApplicationController
  before_filter :authenticate_user!
  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  # Basic scaffold code for viewing a transaction along with a check to prevent a user from viewing another user's transaction
  def show
    @transaction = Transaction.find(params[:id])
    if(@transaction.user_id == current_user.id)
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @transaction }
      end
      else
      redirect_to root_path
    end
  end

  # GET /transactions/new
  # GET /transactions/new.json
  def new
    @transaction = Transaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.json
  # Generates the transaction for buying and also updates the item table to reflect that the item is bought.
  # Performs check on available quantities. Also persists entire item details at the time of transaction for logging
  # purposes as well as display in profile page and transaction details page.
  def create
    @transaction = Transaction.new(params[:transaction])
    #@item = Item.find(@transaction.item_id)
    #@item.buyer_id = current_user.id
    @transaction.user_id = current_user.id
    @shopping_cart = ShoppingCart.find_by_user_id(current_user.id)
    error_flag = 0
    error_message = ""
    available_item = Array.new
    eval(@shopping_cart.item_list).each do |item_id, quantity|
      item = Item.find(Integer(item_id))
      if item.quantity < quantity
        error_message = "Sorry! Only #{item.quantity} of #{item.title} is available at the moment"
        error_flag = 1
      else
        available_item += [item]
        item.quantity -= quantity
      end
    end

    if error_flag == 1
      redirect_to @shopping_cart, notice: error_message
    else
      item_list = Hash.new
      eval(@shopping_cart.item_list).each do |item_id, item_quantity|
        index = Item.find(Integer(item_id)).attributes.except("created_at", "updated_at", "product_file_name",
                                                              "product_content_type", "product_file_size", "product_updated_at")
        item_list[index] = item_quantity
      end
      @transaction.item_list = item_list.to_s

      respond_to do |format|
        if @transaction.save
          available_item.each do |item|
            item.save
          end
          @shopping_cart.delete
          format.html { redirect_to @transaction, notice: 'Transaction successful.' }
          format.json { render json: @transaction, status: :created, location: @transaction }
        else
          format.html { render action: "new" }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def update
    @transaction = Transaction.find(params[:id])
    @item = Item.find(@transaction_item_id)
    @item.buyer_id=current_user.id

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  # This method gets all the transactions belonging to the current user
  def my_transactions
    @transactions = Transaction.find_all_by_user_id(current_user.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
    end
  end
end
