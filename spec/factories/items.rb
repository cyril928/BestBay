# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    title "MyString"
    category "MyString"
    description "MyString"
    condition "MyString"
    duration 12
    price 1
    user_id 1
    buyer_id 1
    quantity 5
  end
end
