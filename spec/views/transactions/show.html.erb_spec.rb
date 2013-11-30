require 'spec_helper'

describe "transactions/show" do
  before(:each) do
   @transaction = assign(:transaction, stub_model(Transaction,
    :name => "test",
    :card_number => "123456789123",
    :expiry_date => "1111",
    :address => "testaddress",
    :item_list => "{{\"id\"=>1, \"title\"=>\"test_item_title\", \"category\"=>\"test_item_category\", \"description\"=>\"test_item_description\",
 \"condition\"=>\"test_item_condition\", \"duration\"=>12, \"price\"=>1000, \"user_id\"=>1, \"total_quantity\"=>10, \"quantity\"=>5} => 2}",
    :total_amount => 2000,
    :reward_points_earned => 200,
    :reward_points_spent => 0
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match("test")
    rendered.should match("123456789123")
    rendered.should match("testaddress")
    rendered.should match("1111")
    rendered.should match("test_item_title")
    rendered.should match("1000")
    rendered.should match("2")
    rendered.should match("2000")
    rendered.should match("200")
    rendered.should match("0")
  end
end
