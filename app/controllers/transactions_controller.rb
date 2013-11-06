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
  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.json
  # Start of buy transaction and ensures that the seller cannot buy a product he has posted
  def new
    @transaction = Transaction.new
    @item = Item.find(params[:item_id])
    #params[:item_id] = nil
    if current_user.id  == @item.user_id
      redirect_to root_path
    else
      #@transaction.item_id = @item.id
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @transaction }
      end
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.json
  # Generates the transaction for buying and also updates the item table to reflect that the item is bought.
  def create
    @transaction = Transaction.new(params[:transaction])
    @item = Item.find(@transaction.item_id)
    @item.buyer_id=current_user.id

    respond_to do |format|
      if (@transaction.save && @item.save)
        format.html { redirect_to @transaction, notice: 'Transaction successful.' }
        format.json { render json: @transaction, status: :created, location: @transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def update
    @transaction = Transaction.find(params[:id])

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
end
