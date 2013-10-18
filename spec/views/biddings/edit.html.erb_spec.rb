require 'spec_helper'

describe "biddings/edit" do
=begin
  before(:each) do
    @bidding = assign(:bidding, stub_model(Bidding,
      :item_id => 1,
      :seller_id => 1,
      :bidder_id => 1,
      :price => 1
    ))
  end

  it "renders the edit bidding form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bidding_path(@bidding), "post" do
      assert_select "input#bidding_item_id[name=?]", "bidding[item_id]"
      assert_select "input#bidding_seller_id[name=?]", "bidding[seller_id]"
      assert_select "input#bidding_bidder_id[name=?]", "bidding[bidder_id]"
      assert_select "input#bidding_price[name=?]", "bidding[price]"
    end
  end
=end
end
