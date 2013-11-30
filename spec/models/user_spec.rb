require 'spec_helper'

describe User do
  subject { FactoryGirl.build :user }
  #pending "add some examples to (or delete) #{__FILE__}"



  it {should respond_to(:last_name)}
  it {should respond_to(:first_name)}
  it {should respond_to(:street)}
  it {should respond_to(:country)}
  it {should respond_to(:zip)}
  it {should respond_to(:phone)}


  it "should have valid factory" do
    FactoryGirl.build(:user).should be_valid
  end

  describe "Last Name" do
    it "Last Name should be required" do
      blank = FactoryGirl.build(:user, :last_name => "")
      blank.should_not be_valid
      blank.errors[:last_name].should include("can't be blank")

      blank.last_name = "Mel"
      blank.should be_valid

    end

    it "length of Last Name should be less than 50" do
      too_long = FactoryGirl.build(:user, :last_name => 'a' * 51)
      too_long.should_not be_valid
      too_long.errors[:last_name].should include("is too long (maximum is 50 characters)")

      too_long.last_name = 'a' * 50
      too_long.should be_valid
    end
  end

  describe "First Name" do
    it "First Name should be required" do
      blank = FactoryGirl.build(:user, :first_name => "")
      blank.should_not be_valid
      blank.errors[:first_name].should include("can't be blank")

      blank.first_name = "Mel"
      blank.should be_valid



    end

    it "length of Last Name should be less than 50" do
      too_long = FactoryGirl.build(:user, :last_name => 'a' * 51)
      too_long.should_not be_valid
      too_long.errors[:last_name].should include("is too long (maximum is 50 characters)")

      too_long.last_name = 'a' * 50
      too_long.should be_valid
    end
  end

  describe "Street" do
    it "Street should be required" do
      blank = FactoryGirl.build(:user, :street => "")
      blank.should_not be_valid
      blank.errors[:street].should include("can't be blank")

      blank.street = "Fifth Avenue"
      blank.should be_valid



    end

    it "length of Street should be less than 50" do
      too_long = FactoryGirl.build(:user, :street => 'a' * 51)
      too_long.should_not be_valid
      too_long.errors[:street].should include("is too long (maximum is 50 characters)")

      too_long.street = 'a' * 50
      too_long.should be_valid
    end
  end

  describe "Country" do
    it "Country should be required" do
      blank = FactoryGirl.build(:user, :country => "")
      blank.should_not be_valid
      blank.errors[:country].should include("can't be blank")

      blank.country = "Fifth Avenue"
      blank.should be_valid



    end

    it "length of Country should be less than 50" do
      too_long = FactoryGirl.build(:user, :country => 'a' * 51)
      too_long.should_not be_valid
      too_long.errors[:country].should include("is too long (maximum is 50 characters)")

      too_long.country = 'a' * 50
      too_long.should be_valid
    end
  end

  describe "Zip" do

    it "length of Zip should be less than  11" do
      too_long = FactoryGirl.build(:user, :zip => '1' * 11)
      too_long.should_not be_valid
      too_long.errors[:zip].should include("is too long (maximum is 10 characters)")

      too_long.zip = '1' * 8
      too_long.should be_valid
    end

    it "length of Zip should be greater than  4" do
      too_short = FactoryGirl.build(:user, :zip => '1' * 4)
      too_short.should_not be_valid
      too_short.errors[:zip].should include("is too short (minimum is 5 characters)")

      too_short.zip = '1' * 8
      too_short.should be_valid
    end

    it "Zip should be a number" do
      zip_number = FactoryGirl.build(:user, :zip => 'aaa')
      zip_number.should_not be_valid
      zip_number.errors[:zip].should include("is not a number")

      zip_number.zip = '111111'
      zip_number.should be_valid
    end
  end

  describe "Phone" do

    it "length of Phone should be less than  32" do
      too_long = FactoryGirl.build(:user, :phone => '1' * 33)
      too_long.should_not be_valid
      too_long.errors[:phone].should include("is too long (maximum is 32 characters)")

      too_long.phone = '1' * 8
      too_long.should be_valid
    end

    it "length of Phone should be greater than  7" do
      too_short = FactoryGirl.build(:user, :phone => '1' * 5)
      too_short.should_not be_valid
      too_short.errors[:phone].should include("is too short (minimum is 7 characters)")

      too_short.phone = '1' * 8
      too_short.should be_valid
    end

    it "Phone should be a number" do
      phone = FactoryGirl.build(:user, :phone => 'aaa')
      phone.should_not be_valid
      phone.errors[:phone].should include("is not a number")

      phone.phone = '111111111'
      phone.should be_valid
    end
  end

  describe "reward_points" do
    it "Reward points should be required" do
      user = FactoryGirl.build(:user, :reward_points => '')
      user.should_not be_valid
      user.errors[:reward_points].should include("can't be blank")

      user.reward_points = '100'
      user.should be_valid
    end

    it "Reward points should be a number" do
      user = FactoryGirl.build(:user, :reward_points => 'aaa')
      user.should_not be_valid
      user.errors[:reward_points].should include("is not a number")

      user.reward_points = '100'
      user.should be_valid
    end
  end

end


