require 'spec_helper'

describe Item do
  #pending "add some examples to (or delete) #{__FILE__}"
  before {@item = Item.new}

  subject {@item}
  context 'item' do
  #let(:item) {FactoryGirl.create(:item)}

    it {should respond_to(:title)}
    it {should respond_to(:category)}
    it {should respond_to(:description)}
    it {should respond_to(:condition)}
    it {should respond_to(:duration)}
    it {should respond_to(:price)}
    it {should respond_to(:user_id)}
    it {should respond_to(:buyer_id)}
    it {should respond_to(:product_file_name)}
    it {should respond_to(:product_content_type)}
    it {should respond_to(:product_file_size)}
    it {should respond_to(:product_updated_at)}
  end

  context 'after item is saved,' do
    it 'the number of item plus one' do
      expect { @item.save }.to change { Item.count }.by(1)
    end
  end

end
