require 'spec_helper'

describe "rating_comments/edit" do
  before(:each) do
    @rating_comment = assign(:rating_comment, stub_model(RatingComment,
      :user_id => 1,
      :seller_id => 1,
      :item_id => 1,
      :rating => 1,
      :comment => "MyString",
      :is_seller_rating => 1
    ))
  end

  it "renders the edit rating_comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rating_comment_path(@rating_comment), "post" do
      assert_select "input#rating_comment_user_id[name=?]", "rating_comment[user_id]"
      assert_select "input#rating_comment_seller_id[name=?]", "rating_comment[seller_id]"
      assert_select "input#rating_comment_item_id[name=?]", "rating_comment[item_id]"
      assert_select "input#rating_comment_rating[name=?]", "rating_comment[rating]"
      assert_select "input#rating_comment_comment[name=?]", "rating_comment[comment]"
      assert_select "input#rating_comment_is_seller_rating[name=?]", "rating_comment[is_seller_rating]"
    end
  end
end
