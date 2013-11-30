require "spec_helper"

describe TransactionsController do
  describe "routing" do

=begin
    it "routes to #index" do
      get("/transactions").should route_to("transactions#index")
    end
=end

    it "routes to #new" do
      get("/transactions/new").should route_to("transactions#new")
    end

    it "routes to #show" do
      get("/transactions/1").should route_to("transactions#show", :id => "1")
    end

=begin
    it "routes to #edit" do
      get("/transactions/1/edit").should route_to("transactions#edit", :id => "1")
    end
=end

    it "routes to #create" do
      post("/transactions").should route_to("transactions#create")
    end

=begin
    it "routes to #update" do
      put("/transactions/1").should route_to("transactions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/transactions/1").should route_to("transactions#destroy", :id => "1")
    end
=end
    it "route to #my_transactions" do
      get("/my_transactions").should route_to("transactions#my_transactions")
    end

    it "route to #reward_points_only" do
      get("/reward_points_only").should route_to("transactions#reward_points_only")
    end
  end
end
