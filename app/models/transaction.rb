class Transaction < ActiveRecord::Base
  # Basic relationship of a transaction belonging to a user(buyer) and the normal attributes as present in the database
  belongs_to :user
  attr_accessible :address, :card_number, :expiry_date, :name, :user_id, :item_list, :total_amount, :reward_points_earned, :reward_points_spent

  # Basic validation according to business and design rules
  begin
    validates :name,  presence: true, length: {  :minimum => 2, :maximum => 105 }
    validates :card_number,  presence: true, length: { :minimum => 12, :maximum => 19 }
    validates :expiry_date,  presence: true, numericality: true, length: { :minimum => 4, :maximum => 4}
    validates :address,  presence: true, length: {  :minimum => 5, :maximum => 105 }
    validates :item_list,  presence: true
    validates :total_amount, presence: true, numericality: true
    validates :reward_points_earned, presence: true, numericality: true
    validates :reward_points_spent, presence: true, numericality: true
  end

end
