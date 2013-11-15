class ShoppingCart < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :item_list
end
