require 'spec_helper'
require 'rack/test'
# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ItemsController do
  before (:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    @item = FactoryGirl.create(:item)
    @transaction = FactoryGirl.create(:transaction)
    sign_in @user
  end
  # This should return the minimal set of attributes required to create a valid
  # Item. As you add validations to Item, be sure to
  # adjust the attributes here as well.
  #let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ItemsController. Be sure to keep this updated too.
  #let(:valid_session) { {} }

  #@user = FactoryGirl.create(:user)
=begin
  @user_attr = FactoryGirl.attributes_for(:user)
  #@user = User.create!(@user_attr)
  user = User.where({:email => @user_attr[:email]})
  describe "GET index" do
    it "renders the index template" do

      sign_in user
      get :index
      expect(response).to render_template("index")
      expect(response.body).to eq ""
      sign_out user
    end
    it "renders the items/index template" do
      get :index
      expect(response).to render_template("index")
      expect(response.body).to eq ""
    end
  end
=end

  describe "User uses category search and page will redirect to home page" do
    it "redirects to the home page" do
      get :search
      expect(response).to redirect_to root_path
    end
  end

  describe "User uses keyword search and page will redirect to home page" do
    it "redirects to the home page" do
      post :search
      expect(response).to redirect_to root_path
    end
  end

  describe "Search result is what user expects" do
    it "when user uses category search" do
      get :search, {:category_query => "TV & Home Theater"}
      @result = Item.select(:id).where({category: "TV & Home Theater"})
      expect(assigns(:items)).to eq @result

    end
    it "when user uses keyword search" do
      post :search, {:category_query => "TV & Home Theater", :keyword => "panasonic"}
      @result = Item.select(:id).where({category: "TV & Home Theater", title: "panasonic"})
      expect(assigns(:items)).to eq @result
    end
  end

  #login_user
  describe "Signed in user" do
    it "should be a signed in user" do
      subject.current_user.should_not be_nil
    end
  end

  describe "GET new" do
    it "assigns a new item as @item" do
      get :new
      assigns(:item).should be_a_new(Item)
    end
    it "assigns a new revenue as @revenue" do
      get :new
      assigns(:revenue).should be_a_new(Revenue)
    end
  end

  let(:item_valid_attributes) {{ "title" => "test", "category" => "Electronics", "description" => "Good status", "condition" => "Great",
  "price" => 100, "total_quantity" => 10, "active" => 1, "is_advertisement" => 0, "product" => Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/rails.png', 'rails/png') }}

  let(:revenue_valid_attributes) {{ "name" => "test", "card_number" => "1234456789123", "expiry_date" => 1111, "address" => "
  Howe Street"}}

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Item" do
        Item.any_instance.stub(:save_attached_files).and_return(true)
        expect {
          post :create, {:item => item_valid_attributes, :name => "test", :card_number => "1234456789123",
                         :expiry_date => "1111", :address => "Howe Street"}
        }.to change(Revenue, :count).by(1)
      end


      it "creates a new Revenue" do
        expect {
          post :create, {:item => item_valid_attributes, :name => "test", :card_number => "1234456789123",
                         :expiry_date => "1111", :address => "Howe Street"}
        }.to change(Revenue, :count).by(1)
      end

      it "assigns a newly created item as @item" do
        post :create, {:item => item_valid_attributes, :name => "test", :card_number => "1234456789123",
                       :expiry_date => "1111", :address => "Howe Street"}
        assigns(:item).should be_a(Item)
        assigns(:item).should be_persisted
      end

      it "assigns a newly created revenue as @revenue" do
        post :create, {:item => item_valid_attributes, :name => "test", :card_number => "1234456789123",
                       :expiry_date => "1111", :address => "Howe Street"}
        assigns(:revenue).should be_a(Revenue)
        assigns(:revenue).should be_persisted
      end

    end

    describe "with invalid params" do

      it "assigns a newly created but unsaved item as @item" do
        # Trigger the behavior that occurs when invalid params are submitted
        #Revenue.any_instance.stub(:save).and_return(false)
        post :create, {:item => { "title" => "", "category" => "Electronics", "description" => "Good status", "condition" => "Great",
                                  "price" => 100, "total_quantity" => 10, "active" => 1}, :name => "test", :card_number => "1",
                       :expiry_date => "1", :address => "Howe Street"}
        assigns(:item).should be_a_new(Item)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        #Revenue.any_instance.stub(:save).and_return(false)
        post :create, {:item => { "title" => "", "category" => "Electronics", "description" => "Good status", "condition" => "Great",
                                  "price" => 100, "total_quantity" => 10, "active" => 1, "is_advertisement" => 0}, :name => "test", :card_number => "1",
                       :expiry_date => "1", :address => "Howe Street"}
        response.should render_template("new")
      end


      it "assigns a newly created but unsaved revenue as @revenue" do
        # Trigger the behavior that occurs when invalid params are submitted
        #Revenue.any_instance.stub(:save).and_return(false)
        post :create, {:item => item_valid_attributes, :name => "test", :card_number => "1",
                       :expiry_date => "1", :address => "Howe Street"}
        assigns(:revenue).should be_a_new(Revenue)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        #Revenue.any_instance.stub(:save).and_return(false)
        post :create, {:item => item_valid_attributes, :name => "test", :card_number => "1",
                       :expiry_date => "1", :address => "Howe Street"}
        response.should render_template("new")
      end
    end
  end

let(:item_valid_attributes_show) {{ "title" => "test", "category" => "Electronics", "description" => "Good status", "condition" => "Great",
                                 "price" => 100, "total_quantity" => 10, "quantity" => 10 , "active" => 1, "is_advertisement" => 0,
                                 "product" => Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/rails.png', 'image/png')}}

  describe "GET show" do
    it "assigns the requested item as @item" do
      item = Item.create! item_valid_attributes_show
      get :show, {:id => item.to_param}
      assigns(:item).should eq(item)
    end
    it "it assigns @rating_comment_hash" do
      item = Item.create! item_valid_attributes_show
      get :show, {:id => item.to_param}
      assigns(:rating_comment_hash).should be_a(Hash)
    end
    it "it assigns @current_user_comment" do
      item = Item.create! item_valid_attributes_show
      get :show, {:id => item.to_param}
      assigns(:current_user_comment).should be(nil)
    end
    it "it assigns @current_user_rating" do
      item = Item.create! item_valid_attributes_show
      get :show, {:id => item.to_param}
      assigns(:current_user_rating).should be(nil)
    end

  end

=begin
  describe "GET index" do
    it "assigns all items as @items" do
      item = Item.create! valid_attributes
      get :index, {}, valid_session
      assigns(:items).should eq([item])
    end
  end

  describe "GET show" do
    it "assigns the requested item as @item" do
      item = Item.create! valid_attributes
      get :show, {:id => item.to_param}, valid_session
      assigns(:item).should eq(item)
    end
  end

  describe "GET new" do
    it "assigns a new item as @item" do
      get :new, {}, valid_session
      assigns(:item).should be_a_new(Item)
    end
  end

  describe "GET edit" do
    it "assigns the requested item as @item" do
      item = Item.create! valid_attributes
      get :edit, {:id => item.to_param}, valid_session
      assigns(:item).should eq(item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Item" do
        expect {
          post :create, {:item => valid_attributes}, valid_session
        }.to change(Item, :count).by(1)
      end

      it "assigns a newly created item as @item" do
        post :create, {:item => valid_attributes}, valid_session
        assigns(:item).should be_a(Item)
        assigns(:item).should be_persisted
      end

      it "redirects to the created item" do
        post :create, {:item => valid_attributes}, valid_session
        response.should redirect_to(Item.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved item as @item" do
        # Trigger the behavior that occurs when invalid params are submitted
        Item.any_instance.stub(:save).and_return(false)
        post :create, {:item => { "title" => "invalid value" }}, valid_session
        assigns(:item).should be_a_new(Item)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Item.any_instance.stub(:save).and_return(false)
        post :create, {:item => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested item" do
        item = Item.create! valid_attributes
        # Assuming there are no other items in the database, this
        # specifies that the Item created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Item.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
        put :update, {:id => item.to_param, :item => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested item as @item" do
        item = Item.create! valid_attributes
        put :update, {:id => item.to_param, :item => valid_attributes}, valid_session
        assigns(:item).should eq(item)
      end

      it "redirects to the item" do
        item = Item.create! valid_attributes
        put :update, {:id => item.to_param, :item => valid_attributes}, valid_session
        response.should redirect_to(item)
      end
    end

    describe "with invalid params" do
      it "assigns the item as @item" do
        item = Item.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Item.any_instance.stub(:save).and_return(false)
        put :update, {:id => item.to_param, :item => { "title" => "invalid value" }}, valid_session
        assigns(:item).should eq(item)
      end

      it "re-renders the 'edit' template" do
        item = Item.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Item.any_instance.stub(:save).and_return(false)
        put :update, {:id => item.to_param, :item => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested item" do
      item = Item.create! valid_attributes
      expect {
        delete :destroy, {:id => item.to_param}, valid_session
      }.to change(Item, :count).by(-1)
    end

    it "redirects to the items list" do
      item = Item.create! valid_attributes
      delete :destroy, {:id => item.to_param}, valid_session
      response.should redirect_to(items_url)
    end
  end
=end

end
