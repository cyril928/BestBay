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
    product_file_name "images_(1).jpeg"
    product_content_type "image/jpeg"
    product_file_size 9403
    product_updated_at "2013-11-17 03:24:44.982879"
  end


end
