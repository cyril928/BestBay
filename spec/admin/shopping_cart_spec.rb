require 'spec_helper'

describe ShoppingCart do

  describe 'ActiveAdmin Configuration' do
    let(:resource_class) { "ShoppingCart"}
    let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
    let(:resource)       { all_resources[resource_class] }

    it 'active admin should support another table for shopping cart' do
      ActiveAdmin.application.namespaces[:admin].resources.should have_key("ShoppingCart")
    end

    it 'the ShoppingCart resource should be exist ' do
      resource.resource_name.should == "ShoppingCart"
    end

    it 'the ShoppingCart should in the menu of the admin view' do
      resource.should be_include_in_menu
    end

    it 'Admin has the privilege to do some operation on ShoppingCart' do
      resource.defined_actions.should =~ [:create, :new, :update, :edit, :index, :show, :destroy]
    end
  end
end