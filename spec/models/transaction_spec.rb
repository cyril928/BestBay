require 'spec_helper'

describe Transaction  do

 let(:transaction) {FactoryGirl.create(:transaction)}
 subject {transaction}
 context 'transaction' do

  it {should respond_to(:name)}
  it {should respond_to(:card_number)}
  it {should respond_to(:expiry_date)}
  it {should respond_to(:address)}
  it {should respond_to(:item_list)}
  it {should respond_to(:total_amount)}
  it {should respond_to(:reward_points_earned)}
  it {should respond_to(:reward_points_spent)}
 end

  describe "name" do
    it "should be required" do
    blank = FactoryGirl.build(:transaction, :name => "")
    blank.should_not be_valid
    blank.errors[:name].should include("can't be blank")

    blank.name = "Foo"
    blank.should be_valid
    end
  end
  describe "card_number" do
    it "should be required" do
      blank = FactoryGirl.build(:transaction, :card_number => "")
      blank.should_not be_valid
      blank.errors[:card_number].should include("can't be blank")

      blank.card_number = 654321654321
      blank.should be_valid
    end
  end
  describe "expiry_date" do
      it "should be required" do
        blank = FactoryGirl.build(:transaction, :expiry_date => "")
        blank.should_not be_valid
        blank.errors[:expiry_date].should include("can't be blank")

        blank.expiry_date = 1204
        blank.should be_valid
      end
  end
 describe "item_list" do
   it "should be required" do
     blank = FactoryGirl.build(:transaction, :item_list => "")
     blank.should_not be_valid
     blank.errors[:item_list].should include("can't be blank")

     blank.item_list = "{\"1\" => 2}"
     blank.should be_valid
   end
 end

 describe "total_amount" do
   it "should be required" do
     test_transaction = FactoryGirl.build(:transaction, :total_amount => "")
     test_transaction.should_not be_valid
     test_transaction.errors[:total_amount].should include("can't be blank")

     test_transaction.total_amount = 1000
     test_transaction.should be_valid
   end

   it "should be a number" do
     test_transaction = FactoryGirl.build(:transaction, :total_amount => 'aaa')
     test_transaction.should_not be_valid
     test_transaction.errors[:total_amount].should include("is not a number")

     test_transaction.total_amount = 1000
     test_transaction.should be_valid
   end
 end

 describe "reward_points_earned" do
   it "should be required" do
     test_transaction = FactoryGirl.build(:transaction, :reward_points_earned => "")
     test_transaction.should_not be_valid
     test_transaction.errors[:reward_points_earned].should include("can't be blank")

     test_transaction.reward_points_earned = 100
     test_transaction.should be_valid
   end

   it "should be a number" do
     test_transaction = FactoryGirl.build(:transaction, :reward_points_earned => 'aaa')
     test_transaction.should_not be_valid
     test_transaction.errors[:reward_points_earned].should include("is not a number")

     test_transaction.reward_points_earned = 100
     test_transaction.should be_valid
   end
 end

 describe "reward_points_spent" do
   it "should be required" do
     test_transaction = FactoryGirl.build(:transaction, :reward_points_spent => "")
     test_transaction.should_not be_valid
     test_transaction.errors[:reward_points_spent].should include("can't be blank")

     test_transaction.reward_points_spent = 100
     test_transaction.should be_valid
   end

   it "should be a number" do
     test_transaction = FactoryGirl.build(:transaction, :reward_points_spent => 'aaa')
     test_transaction.should_not be_valid
     test_transaction.errors[:reward_points_spent].should include("is not a number")

     test_transaction.reward_points_spent = 1000
     test_transaction.should be_valid
   end
 end

end
