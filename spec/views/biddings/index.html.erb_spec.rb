require 'spec_helper'

describe "biddings/index" do
=begin
  before(:each) do
    assign(:biddings, [
      stub_model(Bidding,
        :item_id => 1,
        :seller_id => 2,
        :bidder_id => 3,
        :price => 4
      ),
      stub_model(Bidding,
        :item_id => 1,
        :seller_id => 2,
        :bidder_id => 3,
        :price => 4
      )
    ])
  end

  it "renders a list of biddings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
=end
end
