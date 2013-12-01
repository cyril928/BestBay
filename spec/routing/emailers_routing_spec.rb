require "spec_helper"

describe EmailersController do

  describe "routing" do

    it "route to get#email" do
      get("/Emailer/index").should route_to("emailers#index")
    end

    it "route to post#email" do
      post("/Emailer/index").should route_to("emailers#index")
    end

  end
end