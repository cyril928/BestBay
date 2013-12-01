require "spec_helper"

describe UsersController do
  describe "routing" do

    it "route to #signup" do
      get("/signup").should route_to("users#new")
    end

  end
end