class Transaction < ActiveRecord::Base
  has_one :item
  attr_accessible :address, :card_number, :expiry_date, :name, :item_id

  begin
    validates :name,  presence: true, length: {  :minimum => 2, :maximum => 105 }
    validates :card_number,  presence: true, numericality: true, length: { :minimum => 12, :maximum => 19 }
    validates :expiry_date,  presence: true, numericality: true, length: { :minimum => 4, :maximum => 4}
    validates :address,  presence: true, length: {  :minimum => 5, :maximum => 105 }
    validates :item_id,  presence: true, numericality: true
  end

end
