class ApplicationController < ActionController::Base
  protect_from_forgery
  # check for presence of shopping cart for a user, retrieve if present.
  before_filter :show_shopping_cart

  def show_shopping_cart
    if(!current_user.nil?)
      @shopping_cart = ShoppingCart.find_by_user_id(current_user.id)
    end
  end

end
