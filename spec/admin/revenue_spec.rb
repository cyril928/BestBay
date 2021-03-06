require 'spec_helper'

describe Revenue do

  describe 'ActiveAdmin Configuration' do
    let(:resource_class) { "Revenue"}
    let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
    let(:resource)       { all_resources[resource_class] }

    it 'active admin should support another table for revenue' do
      ActiveAdmin.application.namespaces[:admin].resources.should have_key("Revenue")
    end

    it 'the Revenue resource should be exist ' do
      resource.resource_name.should == "Revenue"
    end

    it 'the Revenue should in the menu of the admin view' do
      resource.should be_include_in_menu
    end

    it 'Admin has the privilege to do some operation on Revenue' do
      resource.defined_actions.should =~ [:create, :new, :update, :edit, :index, :show, :destroy]
    end
  end
end