require 'spec_helper'

describe "transactions/new" do

  before(:each) do
    assign(:transaction, stub_model(Transaction,
      :name => "",
      :card_number => "",
      :expiry_date => "",
      :address => "",
      :item_list => ""
    ).as_new_record)
    @item = FactoryGirl.create(:item)
  end
  it "renders new transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transactions_path, "post" do
      assert_select "input#transaction_name[name=?]", "transaction[name]"
      assert_select "input#transaction_card_number[name=?]", "transaction[card_number]"
      assert_select "input#transaction_expiry_date[name=?]", "transaction[expiry_date]"
      assert_select "input#transaction_address[name=?]", "transaction[address]"
  end
  end

end
