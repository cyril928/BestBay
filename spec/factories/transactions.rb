# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    name "test"
    card_number "123456789123"
    expiry_date "1111"
    address "testaddress"
    user_id 1
    item_list "{{\"id\"=>1, \"title\"=>\"test_item_title\", \"category\"=>\"test_item_category\", \"description\"=>\"test_item_description\",
 \"condition\"=>\"test_item_condition\", \"duration\"=>12, \"price\"=>1000, \"user_id\"=>1, \"total_quantity\"=>10, \"quantity\"=>5, \"is_advertisement\"=>0} => 2}"
    total_amount 2000
    reward_points_earned 200
    reward_points_spent 0
  end
end
