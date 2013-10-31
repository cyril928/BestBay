require 'spec_helper'

describe "transactions/new" do
  before(:each) do
    assign(:transaction, stub_model(Transaction,
      :name => "",
      :cardnum => "",
      :dateofexpire => "",
      :address => ""
    ).as_new_record)
  end

  it "renders new transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transactions_path, "post" do
      assert_select "input#transaction_name[name=?]", "transaction[name]"
      assert_select "input#transaction_cardnum[name=?]", "transaction[cardnum]"
      assert_select "input#transaction_dateofexpire[name=?]", "transaction[dateofexpire]"
      assert_select "input#transaction_address[name=?]", "transaction[address]"
    end
  end
end
