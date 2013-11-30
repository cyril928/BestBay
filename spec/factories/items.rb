# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    title "test_item_title"
    category "test_item_category"
    description "test_item_description"
    condition "test_item_condition"
    duration 12
    price 1000
    user_id 1
    total_quantity 10
    quantity 5
    active 1
  end


end
