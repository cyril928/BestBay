class Transaction < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :card_number, :expiry_date, :name, :user_id, :item_list

  begin
    validates :name,  presence: true, length: {  :minimum => 2, :maximum => 105 }
    validates :card_number,  presence: true, numericality: true, length: { :minimum => 12, :maximum => 19 }
    validates :expiry_date,  presence: true, numericality: true, length: { :minimum => 4, :maximum => 4}
    validates :address,  presence: true, length: {  :minimum => 5, :maximum => 105 }
  end

end
