require 'spec_helper'

describe "items/index" do
  before(:each) do
    assign(:items, [
      stub_model(Item,
        :title => "Title",
        :category => "Category",
        :description => "Description",
        :condition => "Condition",
        :duration => "Duration",
        :price => 1,
        :user_id => 2,
        :buyer_id => 3
      ),
      stub_model(Item,
        :title => "Title",
        :category => "Category",
        :description => "Description",
        :condition => "Condition",
        :duration => "Duration",
        :price => 1,
        :user_id => 2,
        :buyer_id => 3
      )
    ])
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Condition".to_s, :count => 2
    assert_select "tr>td", :text => "Duration".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
