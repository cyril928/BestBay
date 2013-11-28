require 'spec_helper'

describe "rating_comments/show" do
  before(:each) do
    @rating_comment = assign(:rating_comment, stub_model(RatingComment,
      :user_id => 1,
      :seller_id => 2,
      :item_id => 3,
      :rating => 4,
      :comment => "Comment",
      :is_seller_rating => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/Comment/)
    rendered.should match(/5/)
  end
end
