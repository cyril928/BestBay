require 'spec_helper'

describe ShoppingCart do
  #pending "add some examples to (or delete) #{__FILE__}"


  it "has a item list" do
    subject.should respond_to(:item_list)
  end

  context "association test" do
    it "belongs to a user" do
      subject.should respond_to(:user)
    end
  end

end
