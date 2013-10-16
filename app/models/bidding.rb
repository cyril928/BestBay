class Bidding < ActiveRecord::Base
  has_many :users
  belongs_to :item
  attr_accessible :bidder_id, :item_id, :price, :seller_id
end
