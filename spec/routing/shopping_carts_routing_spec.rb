require "spec_helper"

describe ShoppingCartsController do
  describe "routing" do

=begin
    it "routes to #index" do
      get("/shopping_carts").should route_to("shopping_carts#index")
    end
=end

    it "routes to #new" do
      get("/shopping_carts/new").should route_to("shopping_carts#new")
    end

    it "routes to #show" do
      get("/shopping_carts/1").should route_to("shopping_carts#show", :id => "1")
    end

=begin
    it "routes to #edit" do
      get("/shopping_carts/1/edit").should route_to("shopping_carts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/shopping_carts").should route_to("shopping_carts#create")
    end

    it "routes to #update" do
      put("/shopping_carts/1").should route_to("shopping_carts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/shopping_carts/1").should route_to("shopping_carts#destroy", :id => "1")
    end
=end

    it "route to #add_to_cart" do
      get("/add_to_cart").should route_to("shopping_carts#add_to_cart")
    end

    it "route to #update_quantity" do
      post("/update_quantity").should route_to("shopping_carts#update_quantity")
    end

  end
end
