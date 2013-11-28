require 'spec_helper'

describe "rating_comments/index" do
  before(:each) do
    assign(:rating_comments, [
      stub_model(RatingComment,
        :user_id => 1,
        :seller_id => 2,
        :item_id => 3,
        :rating => 4,
        :comment => "Comment",
        :is_seller_rating => 5
      ),
      stub_model(RatingComment,
        :user_id => 1,
        :seller_id => 2,
        :item_id => 3,
        :rating => 4,
        :comment => "Comment",
        :is_seller_rating => 5
      )
    ])
  end

  it "renders a list of rating_comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
