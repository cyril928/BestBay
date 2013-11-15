# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shopping_cart do
    user_id 1
    item_list "{\"1\" => 2}"
  end
end
