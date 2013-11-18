require 'spec_helper'

describe Transaction do

  describe 'ActiveAdmin Configuration' do
    let(:resource_class) { "Transaction"}
    let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
    let(:resource)       { all_resources[resource_class] }

    it 'active admin should support another table for transaction' do
      ActiveAdmin.application.namespaces[:admin].resources.should have_key("Transaction")
    end

    it 'the Transaction resource should be exist ' do
      resource.resource_name.should == "Transaction"
    end

    it 'the Transaction should in the menu of the admin view' do
      resource.should be_include_in_menu
    end

    it 'Admin has the privilege to do some operation on Transaction' do
      resource.defined_actions.should =~ [:create, :new, :update, :edit, :index, :show, :destroy]
    end
  end
end