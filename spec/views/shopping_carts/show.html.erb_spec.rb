require 'spec_helper'

describe "shopping_carts/show" do
  before(:each) do
    @shopping_cart = assign(:shopping_cart, stub_model(ShoppingCart,
      :buyer_id => 1,
      :item_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
