# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    name "Test"
    card_number "123456123456"
    expiry_date "1010"
    address "abcde"
    item_id 1
  end
end
