require "spec_helper"

describe RatingCommentsController do
  describe "routing" do

    it "routes to #index" do
      get("/rating_comments").should route_to("rating_comments#index")
    end

    it "routes to #new" do
      get("/rating_comments/new").should route_to("rating_comments#new")
    end

    it "routes to #show" do
      get("/rating_comments/1").should route_to("rating_comments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/rating_comments/1/edit").should route_to("rating_comments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/rating_comments").should route_to("rating_comments#create")
    end

    it "routes to #update" do
      put("/rating_comments/1").should route_to("rating_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/rating_comments/1").should route_to("rating_comments#destroy", :id => "1")
    end

  end
end
