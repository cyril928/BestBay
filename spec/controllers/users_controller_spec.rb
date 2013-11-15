require 'spec_helper'

describe UsersController do
  before (:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
 # The test below makes no sense after the code is refactored.
=begin
  describe "GET show" do
    it "assigns the current_user as @user" do
      get :show, {:id => @user.to_param}
      assigns(:user).should eq(@user)
    end
  end
=end
end
