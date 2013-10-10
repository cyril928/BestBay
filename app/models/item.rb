class Item < ActiveRecord::Base
  attr_accessible :buyer_id, :category, :condition, :description, :duration, :price, :title, :user_id
end
