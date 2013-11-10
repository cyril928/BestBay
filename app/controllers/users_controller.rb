class UsersController < ApplicationController
  before_filter :authenticate_user!

   #show the item selling, item sold and item bought by a user in his profile
  def show
    @user = User.find(params[:id])
    @items1 = Item.where(:user_id =>current_user.id , :buyer_id=>nil)
    @items2 = Item.where(:user_id =>current_user.id , :buyer_id =>!nil)
    @items3 = Item.find_all_by_buyer_id(current_user.id)

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

