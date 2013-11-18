require 'spec_helper'

describe User do

  describe 'ActiveAdmin Configuration' do
    let(:resource_class) { "User"}
    let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
    let(:resource)       { all_resources[resource_class] }

    it 'active admin should support another table for user' do
      ActiveAdmin.application.namespaces[:admin].resources.should have_key("User")
    end

    it 'the User resource should be exist ' do
      resource.resource_name.should == "User"
    end

    it 'the User should in the menu of the admin view' do
      resource.should be_include_in_menu
    end

    it 'Admin has the privilege to do some operation on User' do
      resource.defined_actions.should =~ [:create, :new, :update, :edit, :index, :show, :destroy]
    end
  end
end