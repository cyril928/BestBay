require 'spec_helper'

describe Transaction  do

 let(:transaction) {FactoryGirl.create(:transaction)}
 subject {transaction}
 context 'transaction' do

  it {should respond_to(:name)}
  it {should respond_to(:card_number)}
  it {should respond_to(:expiry_date)}
  it {should respond_to(:address)}
  it {should respond_to(:item_id)}
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
 describe "item_id" do
   it "should be required" do
     blank = FactoryGirl.build(:transaction, :item_id => "")
     blank.should_not be_valid
     blank.errors[:item_id].should include("can't be blank")

     blank.item_id = 2
     blank.should be_valid
   end
 end
end
