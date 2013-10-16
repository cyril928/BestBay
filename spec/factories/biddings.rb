# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bidding do
    item_id 1
    seller_id 1
    bidder_id 1
    price 1
  end
end
