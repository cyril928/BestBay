require 'spec_helper'

describe AdminUser do
  describe 'ActiveAdmin Configuration' do
    let(:resource_class) { "AdminUser"}
    let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
    let(:resource)       { all_resources[resource_class] }

    it 'active admin should support another table for admin user' do
      ActiveAdmin.application.namespaces[:admin].resources.should have_key("AdminUser")
    end

    it 'the AdminUser resource should be exist ' do
      resource.resource_name.should == "AdminUser"
    end

    it 'the AdminUser should in the menu of the admin view' do
      resource.should be_include_in_menu
    end

    it 'Admin has the privilege to do some operation on AdminUser' do
      resource.defined_actions.should =~ [:create, :new, :update, :edit, :index, :show, :destroy]
    end
  end

end
