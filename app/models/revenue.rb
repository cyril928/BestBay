class Revenue < ActiveRecord::Base
  has_one :user
  has_one :item
  attr_accessible :address, :amount, :card_number, :expiry_date, :is_transaction_revenue, :item_id, :name, :user_id
end
