class ShoppingCart < ActiveRecord::Base
  # Basic attributes and relationship. No validations as instantiated in code and also no business logic applicable at the moment
  belongs_to :user
  attr_accessible :user_id, :item_list
end
