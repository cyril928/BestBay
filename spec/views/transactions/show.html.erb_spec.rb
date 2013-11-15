require 'spec_helper'

describe "transactions/show" do
  before(:each) do
   @transaction = assign(:transaction, stub_model(Transaction,
    :name => "test",
    :cardnum => 123456789123,
    :dateofexpire => 1111,
    :address => "testaddress",
    :item_list => "{{\"id\"=>1, \"title\"=>\"MyString\", \"category\"=>\"MyString\", \"description\"=>\"MyString\",
 \"condition\"=>\"MyString\", \"duration\"=>12, \"price\"=>1, \"user_id\"=>1, \"total_quantity\"=>10, \"quantity\"=>5} => 2}"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match("test")
    rendered.should match("testaddress")
  end
end
