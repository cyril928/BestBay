require 'spec_helper'

describe "items/show" do
=begin
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :title => "Title",
      :category => "Category",
      :description => "Description",
      :condition => "Condition",
      :duration => "Duration",
      :price => 1,
      :user_id => 2,
      :buyer_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Category/)
    rendered.should match(/Description/)
    rendered.should match(/Condition/)
    rendered.should match(/Duration/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
=end
end
