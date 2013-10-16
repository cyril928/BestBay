class ShoppingCart < ActiveRecord::Base
  has_many :items
  attr_accessible :buyer_id, :item_id
end
