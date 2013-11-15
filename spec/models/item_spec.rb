require 'spec_helper'

describe Item do
  #pending "add some examples to (or delete) #{__FILE__}"
  #before {@item = Item.new}
  #before { let(:item) {FactoryGirl.create(:item)} }
  let(:item) {FactoryGirl.create(:item)}
  subject {item}
  context 'item' do

    it {should respond_to(:title)}
    it {should respond_to(:category)}
    it {should respond_to(:description)}
    it {should respond_to(:condition)}
    it {should respond_to(:duration)}
    it {should respond_to(:price)}
    it {should respond_to(:user_id)}
    it {should respond_to(:total_quantity)}
    it {should respond_to(:product_file_name)}
    it {should respond_to(:product_content_type)}
    it {should respond_to(:product_file_size)}
    it {should respond_to(:product_updated_at)}
    it {should respond_to(:quantity)}
  end

  context 'after item is saved,' do
    it 'the number of item plus one' do
      expect { item.save }.to change { Item.count }.by(1)
    end
  end


  describe "title" do
    it "should be required" do
      blank = FactoryGirl.build(:item, :title => "")
      blank.should_not be_valid
      blank.errors[:title].should include("can't be blank")

      blank.title = "Foo"
      blank.should be_valid
    end
=begin
    it "should be longer than 1 character" do
      too_short = FactoryGirl.build(:item, :title => 'a')
      too_short.should_not be_valid
      too_short.errors[:title].should include("is too short (minimum is 2 characters)")

      too_short.title = 'aa'
      too_short.should be_valid
    end
=end
    it "should be shorter than 51 characters" do
      too_long = FactoryGirl.build(:item, :title => 'a' * 51)
      too_long.should_not be_valid
      too_long.errors[:title].should include("is too long (maximum is 50 characters)")

      too_long.title = 'a' * 50
      too_long.should be_valid
    end
  end


  describe "category" do
    it "should be required" do
      blank = FactoryGirl.build(:item, :category => "")
      blank.should_not be_valid
      blank.errors[:category].should include("can't be blank")

      blank.category = "Foo"
      blank.should be_valid
    end
=begin
    it "should be longer than 1 character" do
      too_short = FactoryGirl.build(:item, :title => 'a')
      too_short.should_not be_valid
      too_short.errors[:title].should include("is too short (minimum is 2 characters)")

      too_short.title = 'aa'
      too_short.should be_valid
    end
=end
    it "should be shorter than 51 characters" do
      too_long = FactoryGirl.build(:item, :category => 'a' * 51)
      too_long.should_not be_valid
      too_long.errors[:category].should include("is too long (maximum is 50 characters)")

      too_long.category = 'a' * 50
      too_long.should be_valid
    end
  end

  describe "description" do
    it "should be required" do
      blank = FactoryGirl.build(:item, :description => "")
      blank.should_not be_valid
      blank.errors[:description].should include("can't be blank")

      blank.description = "Foo"
      blank.should be_valid
    end
=begin
    it "should be longer than 1 character" do
      too_short = FactoryGirl.build(:item, :title => 'a')
      too_short.should_not be_valid
      too_short.errors[:title].should include("is too short (minimum is 2 characters)")

      too_short.title = 'aa'
      too_short.should be_valid
    end
=end
    it "should be shorter than 51 characters" do
      too_long = FactoryGirl.build(:item, :description => 'a' * 51)
      too_long.should_not be_valid
      too_long.errors[:description].should include("is too long (maximum is 50 characters)")

      too_long.description = 'a' * 50
      too_long.should be_valid
    end
  end

  describe "condition" do
    it "should be required" do
      blank = FactoryGirl.build(:item, :condition => "")
      blank.should_not be_valid
      blank.errors[:condition].should include("can't be blank")

      blank.condition = "Foo"
      blank.should be_valid
    end
=begin
    it "should be longer than 1 character" do
      too_short = FactoryGirl.build(:item, :title => 'a')
      too_short.should_not be_valid
      too_short.errors[:title].should include("is too short (minimum is 2 characters)")

      too_short.title = 'aa'
      too_short.should be_valid
    end
=end
    it "should be shorter than 51 characters" do
      too_long = FactoryGirl.build(:item, :condition => 'a' * 51)
      too_long.should_not be_valid
      too_long.errors[:condition].should include("is too long (maximum is 50 characters)")

      too_long.condition = 'a' * 50
      too_long.should be_valid
    end
  end

  describe "condition" do
    it "should be required" do
      blank = FactoryGirl.build(:item, :condition => "")
      blank.should_not be_valid
      blank.errors[:condition].should include("can't be blank")

      blank.condition = "Foo"
      blank.should be_valid
    end
=begin
    it "should be longer than 1 character" do
      too_short = FactoryGirl.build(:item, :title => 'a')
      too_short.should_not be_valid
      too_short.errors[:title].should include("is too short (minimum is 2 characters)")

      too_short.title = 'aa'
      too_short.should be_valid
    end
=end
    it "should be shorter than 51 characters" do
      too_long = FactoryGirl.build(:item, :condition => 'a' * 51)
      too_long.should_not be_valid
      too_long.errors[:condition].should include("is too long (maximum is 50 characters)")

      too_long.condition = 'a' * 50
      too_long.should be_valid
    end
  end

=begin
  describe "duration" do
    it "should be required" do
      blank = FactoryGirl.build(:item, :duration => "")
      blank.should_not be_valid
      blank.errors[:duration].should include("can't be blank")

      blank.duration = "123"
      blank.should be_valid
    end


    it "should be longer than 1 character" do
      too_short = FactoryGirl.build(:item, :title => 'a')
      too_short.should_not be_valid
      too_short.errors[:title].should include("is too short (minimum is 2 characters)")

      too_short.title = 'aa'
      too_short.should be_valid
    end


    it "should be shorter than 9 characters" do
      too_long = FactoryGirl.build(:item, :duration => '1' * 9)
      too_long.should_not be_valid
      too_long.errors[:duration].should include("is too long (maximum is 8 characters)")

      too_long.duration = '1' * 8
      too_long.should be_valid
    end

    it "should be a number" do
      too_long = FactoryGirl.build(:item, :duration => 'aaa')
      too_long.should_not be_valid
      too_long.errors[:duration].should include("is not a number")

      too_long.duration = '111'
      too_long.should be_valid
    end
  end
=end

  describe "price" do
    it "should be required" do
      blank = FactoryGirl.build(:item, :price => "")
      blank.should_not be_valid
      blank.errors[:price].should include("can't be blank")

      blank.price = "123"
      blank.should be_valid
    end
=begin
    it "should be longer than 1 character" do
      too_short = FactoryGirl.build(:item, :title => 'a')
      too_short.should_not be_valid
      too_short.errors[:title].should include("is too short (minimum is 2 characters)")

      too_short.title = 'aa'
      too_short.should be_valid
    end
=end
    it "should be shorter than 9 characters" do
      too_long = FactoryGirl.build(:item, :price => '1' * 9)
      too_long.should_not be_valid
      too_long.errors[:price].should include("is too long (maximum is 8 characters)")

      too_long.price = '1' * 8
      too_long.should be_valid
    end

    it "should be a number" do
      too_long = FactoryGirl.build(:item, :price => 'aaa')
      too_long.should_not be_valid
      too_long.errors[:price].should include("is not a number")

      too_long.price = '111'
      too_long.should be_valid
    end
  end

  describe "total_quantity" do
    it "should be required" do
      blank = FactoryGirl.build(:item, :total_quantity => "")
      blank.should_not be_valid
      blank.errors[:total_quantity].should include("can't be blank")

      blank.total_quantity = "123"
      blank.should be_valid
    end
    it "should be greater than 0" do
      too_less = FactoryGirl.build(:item, :total_quantity => '0')
      too_less.should_not be_valid
      too_less.errors[:total_quantity].should include("is not included in the list")

      too_less.total_quantity = 1
      too_less.should be_valid
    end

    it "should be less than 65536" do
      too_large = FactoryGirl.build(:item, :total_quantity => '65536')
      too_large.should_not be_valid
      too_large.errors[:total_quantity].should include("is not included in the list")

      too_large.total_quantity = 65535
      too_large.should be_valid
    end

    it "should be a number" do
      not_a_number = FactoryGirl.build(:item, :total_quantity => 'aaa')
      not_a_number.should_not be_valid
      not_a_number.errors[:total_quantity].should include("is not a number")

      not_a_number.total_quantity = 111
      not_a_number.should be_valid
    end
  end

  describe "quantity" do
    it "should be required" do
      blank = FactoryGirl.build(:item, :quantity => "")
      blank.should_not be_valid
      blank.errors[:quantity].should include("can't be blank")

      blank.quantity = "123"
      blank.should be_valid
    end
    it "should be greater than -1" do
      too_less = FactoryGirl.build(:item, :quantity => '-1')
      too_less.should_not be_valid
      too_less.errors[:quantity].should include("is not included in the list")

      too_less.quantity = 0
      too_less.should be_valid
    end

    it "should be less than 65536" do
      too_large = FactoryGirl.build(:item, :quantity => '65536')
      too_large.should_not be_valid
      too_large.errors[:quantity].should include("is not included in the list")

      too_large.quantity = 65535
      too_large.should be_valid
    end

    it "should be a number" do
      not_a_number = FactoryGirl.build(:item, :quantity => 'aaa')
      not_a_number.should_not be_valid
      not_a_number.errors[:quantity].should include("is not a number")

      not_a_number.quantity = 111
      not_a_number.should be_valid
    end
  end
end
