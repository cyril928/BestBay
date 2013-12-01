require "spec_helper"

describe StaticPagesController do
  describe "routing" do

    it "route to #about" do
      get("/about").should route_to("static_pages#about")
    end

    it "route to #help" do
      get("/help").should route_to("static_pages#help")
    end

  end
end
