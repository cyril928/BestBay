class RatingComment < ActiveRecord::Base
  #belongs_to :user
  belongs_to :item
  attr_accessible :comment, :is_seller_rating, :item_id, :rating, :seller_id, :user_id
end
