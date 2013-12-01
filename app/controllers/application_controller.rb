class ApplicationController < ActionController::Base
  protect_from_forgery
  # To enable redirection to a complete path url after signing in, execute the following method
  before_filter :store_location
  # check for presence of shopping cart for a user, retrieve if present.
  before_filter :show_shopping_cart
  def show_shopping_cart
    if(!current_user.nil?)
      @shopping_cart = ShoppingCart.find_by_user_id(current_user.id)
    end
  end
  # Stores the last accessed url
  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end
  # Assigns the last accessed url or the root path if no previous url to be the url to be redirected to after sign in.
  def after_sign_in_path_for(resource)
    if (resource.is_a?(User))
      session[:previous_url] || root_path
    else if (resource.is_a?(AdminUser))
           admin_dashboard_path(resource)
         end
    end
  end
end
