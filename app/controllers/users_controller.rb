class UsersController < ApplicationController
  before_filter :authenticate_user!
  def show
    @user  = current_user
    @items = Item.find_all_by_user_id(@user.id)
  end
end
