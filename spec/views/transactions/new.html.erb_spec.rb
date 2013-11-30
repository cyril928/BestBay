require 'spec_helper'

describe "transactions/new" do

  before(:each) do
    assign(:transaction, stub_model(Transaction,
      :name => "",
      :card_number => "",
      :expiry_date => "",
      :address => "",
      :item_list => "",
      :total_amount => "2000",
      :reward_points_earned => "",
      :reward_points_spent => ""
    ).as_new_record)
    view.stub(:user_signed_in?) { true }
    view.stub(:current_user) { FactoryGirl.build(:user) }
  end
  it "renders new transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transactions_path, "post" do
      assert_select "input#transaction_name[name=?]", "transaction[name]"
      assert_select "input#transaction_card_number[name=?]", "transaction[card_number]"
      assert_select "input#transaction_expiry_date[name=?]", "transaction[expiry_date]"
      assert_select "input#transaction_address[name=?]", "transaction[address]"
      assert_select "input#transaction_reward_points_spent[name=?]", "transaction[reward_points_spent]"
  end
  end

end
