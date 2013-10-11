class Item < ActiveRecord::Base
  belongs_to :user
  attr_accessible :buyer_id, :category, :condition, :description, :duration, :price, :title, :user_id, :product
  has_attached_file :product, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
