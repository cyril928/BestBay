require 'spec_helper'

describe "biddings/show" do
  before(:each) do
    @bidding = assign(:bidding, stub_model(Bidding,
      :item_id => 1,
      :seller_id => 2,
      :bidder_id => 3,
      :price => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
