# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    name "Test"
    card_number "123456123456"
    expiry_date "1010"
    address "abcde"
    user_id = 1
    item_list "{{\"id\"=>1, \"title\"=>\"MyString\", \"category\"=>\"MyString\", \"description\"=>\"MyString\",
 \"condition\"=>\"MyString\", \"duration\"=>12, \"price\"=>1, \"user_id\"=>1, \"total_quantity\"=>10, \"quantity\"=>5} => 2}"
  end
end
