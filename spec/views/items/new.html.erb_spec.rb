require 'spec_helper'

describe "items/new" do
  before(:each) do
    assign(:item, stub_model(Item,
      :title => "MyString",
      :category => "MyString",
      :description => "MyString",
      :condition => "MyString",
      :duration => "MyString",
      :price => 1,
      :user_id => 1,
      :buyer_id => 1
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", items_path, "post" do
      assert_select "input#item_title[name=?]", "item[title]"
      assert_select "input#item_category[name=?]", "item[category]"
      assert_select "input#item_description[name=?]", "item[description]"
      assert_select "input#item_condition[name=?]", "item[condition]"
      assert_select "input#item_duration[name=?]", "item[duration]"
      assert_select "input#item_price[name=?]", "item[price]"
      assert_select "input#item_user_id[name=?]", "item[user_id]"
      assert_select "input#item_buyer_id[name=?]", "item[buyer_id]"
    end
  end
end
