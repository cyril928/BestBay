require 'spec_helper'

describe "shopping_carts/edit" do
  before(:each) do
    @shopping_cart = assign(:shopping_cart, stub_model(ShoppingCart,
      :buyer_id => 1,
      :item_id => 1
    ))
  end

  it "renders the edit shopping_cart form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shopping_cart_path(@shopping_cart), "post" do
      assert_select "input#shopping_cart_buyer_id[name=?]", "shopping_cart[buyer_id]"
      assert_select "input#shopping_cart_item_id[name=?]", "shopping_cart[item_id]"
    end
  end
end
