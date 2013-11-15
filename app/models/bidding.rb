class Bidding < ActiveRecord::Base
  # Implementation decision pending. No relationship mapping till then
  # has_many :users
  #belongs_to :item
  attr_accessible :bidder_id, :item_id, :price, :seller_id
end
