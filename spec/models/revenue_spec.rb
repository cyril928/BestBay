require 'spec_helper'

describe Revenue do
  let(:revenue) {FactoryGirl.create(:revenue)}
  subject {revenue}
  context 'revenue' do
    it {should respond_to(:user_id)}
    it {should respond_to(:item_id)}
    it {should respond_to(:name)}
    it {should respond_to(:card_number)}
    it {should respond_to(:expiry_date)}
    it {should respond_to(:address)}
    it {should respond_to(:amount)}
    it {should respond_to(:is_transaction_revenue)}
  end

  describe "name" do
    it "should be required" do
      blank = FactoryGirl.build(:revenue, :name => "")
      blank.should_not be_valid
      blank.errors[:name].should include("can't be blank")

      blank.name = "Foo"
      blank.should be_valid
    end
  end
  describe "card_number" do
    it "should be required" do
      blank = FactoryGirl.build(:revenue, :card_number => "")
      blank.should_not be_valid
      blank.errors[:card_number].should include("can't be blank")

      blank.card_number = 654321654321
      blank.should be_valid
    end
  end
  describe "expiry_date" do
    it "should be required" do
      blank = FactoryGirl.build(:revenue, :expiry_date => "")
      blank.should_not be_valid
      blank.errors[:expiry_date].should include("can't be blank")

      blank.expiry_date = 1204
      blank.should be_valid
    end
  end
  describe "address" do
    it "should be required" do
      blank = FactoryGirl.build(:revenue, :address => "")
      blank.should_not be_valid
      blank.errors[:address].should include("can't be blank")

      blank.address = "5700, Centre Ave. #617"
      blank.should be_valid
    end
  end
end
