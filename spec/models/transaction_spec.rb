require 'spec_helper'

describe Transaction
 let(:transaction) {FactoryGirl.create(:transaction)}
 subject {item}
 context 'item' do

  it {should respond_to(:name)}
  it {should respond_to(:cardnum)}
  it {should respond_to(:dateofexpire)}
  it {should respond_to(:address)}
 end
describe "name" do
  it "should be required" do
    blank = FactoryGirl.build(:transaction, :name => "")
    blank.should_not be_valid
    blank.errors[:name].should include("can't be blank")

    blank.title = "Foo"
    blank.should be_valid
  end
  describe "cardnum" do
    it "should be required" do
      blank = FactoryGirl.build(:transaction, :cardnum => "")
      blank.should_not be_valid
      blank.errors[:cardnum].should include("can't be blank")

      blank.title = 123
      blank.should be_valid
    end

    describe "dateofexpire" do
      it "should be required" do
        blank = FactoryGirl.build(:transaction, :dateofexpire => "")
        blank.should_not be_valid
        blank.errors[:dateofexpire].should include("can't be blank")

        blank.title = 1204
        blank.should be_valid
      end

  pending "add some examples to (or delete) #{__FILE__}"
end
