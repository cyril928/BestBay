class UsersController < ApplicationController
  before_filter :authenticate_user!

   #show the item selling, item sold and item bought by a user in his profile
  def show
    @items = Hash.new
    @items[1] = Item.where(:user_id => current_user.id).where("quantity > 0")
    @items[2] = Item.where(:user_id => current_user.id).where("total_quantity <> quantity")
    transactions = Transaction.find_all_by_user_id(current_user.id)
    items_bought = Array.new
    transactions.each do |transaction|
      item_list_hash = eval(transaction.item_list)
      item_list_hash.each do |item_hash, quantity|
        item = Item.new(attributes = item_hash)
        item.id = item_hash["id"]
        if items_bought.all? {|item_temp| item_temp.id != item.id}
          item.quantity = quantity
          items_bought<<item
        else
          items_bought.collect!{|item_temp|
            if(item_temp.id == item.id)
              item_temp.quantity += quantity
            end
            item_temp
          }
        end
        end
    end
    @items[3] = items_bought
  end
    #user can edit his profile
  def edit
    @user = User.find(params[:id])
    @items = Item.find_all_by_user_id(@user.id)
  end

  def update
    @user = User.find(params[:id])
    @items = Item.find_all_by_user_id(@user.id)
    if @user.update_attributes(params[:user])
      redirect_to :action => 'show'
    else
      @item = item.find(:all)
      render :action => 'edit'
    end
  end

end

