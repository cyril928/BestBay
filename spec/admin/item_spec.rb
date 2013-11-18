require 'spec_helper'

describe Item do

  describe 'ActiveAdmin Configuration' do
    let(:resource_class) { "Item"}
    let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
    let(:resource)       { all_resources[resource_class] }

    it 'active admin should support another table for item' do
      ActiveAdmin.application.namespaces[:admin].resources.should have_key("Item")
    end

    it 'the Item resource should be exist ' do
      resource.resource_name.should == "Item"
    end

    it 'the Item should in the menu of the admin view' do
      resource.should be_include_in_menu
    end

    it 'Admin has the privilege to do some operation on Item' do
      resource.defined_actions.should =~ [:create, :new, :update, :edit, :index, :show, :destroy]
    end
  end
end