require 'spec_helper'

describe "transactions/show" do
  before(:each) do
   @transaction = assign(:transaction, stub_model(Transaction,
    :name => "test",
    :cardnum => 123456789123,
    :dateofexpire => 1111,
    :address => "testaddress",
    :item_list => "{\"1\" => 2}"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match("test")
    rendered.should match("testaddress")
  end
end
