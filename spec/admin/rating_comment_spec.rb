require 'spec_helper'

describe RatingComment do

  describe 'ActiveAdmin Configuration' do
    let(:resource_class) { "RatingComment"}
    let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
    let(:resource)       { all_resources[resource_class] }

    it 'active admin should support another table for rating and comment' do
      ActiveAdmin.application.namespaces[:admin].resources.should have_key("RatingComment")
    end

    it 'the RatingComment resource should be exist ' do
      resource.resource_name.should == "RatingComment"
    end

    it 'the RatingComment should in the menu of the admin view' do
      resource.should be_include_in_menu
    end

    it 'Admin has the privilege to do some operation on RatingComment' do
      resource.defined_actions.should =~ [:create, :new, :update, :edit, :index, :show, :destroy]
    end
  end
end