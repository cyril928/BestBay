# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rating_comment do
    user_id 1
    seller_id 1
    item_id 1
    rating 1
    comment "MyString"
    is_seller_rating 1
  end
end
