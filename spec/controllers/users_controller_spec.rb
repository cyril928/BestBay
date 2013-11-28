require 'spec_helper'

describe UsersController do
  before (:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    @item = FactoryGirl.create(:item)
    @transaction = FactoryGirl.create(:transaction)
    sign_in @user
  end

  describe "current user" do
    it "should have a current_user" do
      subject.current_user.should_not be_nil
    end

  end

  #describe "GET index" do
  #  it "assigns @users" do
  #    user = User.create
  #    get :show
  #    expect(assigns(:users)).to eq([user])
  #  end
  #
  #
  #end

  describe "GET #edit" do
    it "assigns signed in user" do
      # user = User.create! valid_attributes
      get :edit, {:id => @user.to_param}
      assigns(:user).should eq(@user)
    end
  end

  describe "Show user page should display the item selling, sold and bought" do
    it "should show the items being sold by user" do
      @items= Item.where(:user_id => @user.id).where("total_quantity <> quantity")

      get :show, {:id => @user.to_param}

      expect(assigns("items")[2]).to eq  @items
    end

    it "should show the items selling by user" do
      @items= Item.where(:user_id => @user.id).where("quantity > 0")

      get :show, {:id => @user.to_param}

      expect(assigns("items")[1]).to eq  @items

    end

    it "should show the items being bought by user" do
      get :show, {:id => @user.to_param}
      #@items= Item.find_all_by_user_id(:id)
      #expect(assigns(:items_bought)).not_to eq  @items
      transactions = Transaction.find_all_by_user_id(@user.id)
      items_bought = Array.new
      transactions.each do |transc|
        item_list_hash = eval(transc.item_list)
        item_list_hash.each do |item_hash, quantity|
          item = Item.new(attributes = item_hash)
          item.id = item_hash["id"]
          if items_bought.all? {|item_temp| item_temp.id != item.id}
            item.quantity = quantity
            items_bought<<item
          end
        end

      end
      expect(assigns("items")[3]).to eq (items_bought)

    end

  end



  #describe "After Editing Profile, user is redirected to Profile page" do
  # it "when user clicks the edit profile page" do
  #   post :update
  #  expect(response).to redirect_to :id
  # end
  #end


  # The test below makes no sense after the code is refactored.
=begin
  describe "GET show" do
    it "assigns the current_user as @user" do
      get :show, {:id => @user.to_param}
      assigns(:user).should eq(@user)
    end
  end
=end
  context "Valid attributes" do
    it "assigns the signed in user as @user" do
      put :update, {:id => @user.to_param}
      assigns(:user).should eq(@user)
    end

    it "User should be redirected to profile page after updating profile page" do
      put :update, {:id => @user.to_param}
      response.should redirect_to(@user)
    end

    it "signs a users out" do
      sign_out @user
      subject.current_user.should be_nil
    end
  end






end


