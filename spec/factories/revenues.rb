# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :revenue do
    user_id 1
    item_id 1
    name "MyString"
    card_number "MyString"
    expiry_date "MyString"
    address "MyString"
    amount 1
    is_transaction_revenue 1
  end
end
