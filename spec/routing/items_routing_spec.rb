require "spec_helper"

describe ItemsController do
begin
  describe "routing" do

=begin
    it "routes to #index" do
      get("/items").should route_to("items#index")
    end
=end

    it "routes to #new" do
      get("/items/new").should route_to("items#new")
    end

    it "routes to #show" do
      get("/items/1").should route_to("items#show", :id => "1")
    end

=begin
    it "routes to #edit" do
      get("/items/1/edit").should route_to("items#edit", :id => "1")
    end
=end

    it "routes to #create" do
      post("/items").should route_to("items#create")
    end

=begin
    it "routes to #update" do
      put("/items/1").should route_to("items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/items/1").should route_to("items#destroy", :id => "1")
    end
=end

  end
end
end
