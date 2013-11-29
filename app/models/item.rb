class Item < ActiveRecord::Base
  # An item belongs to a user(seller)
  belongs_to :user
  # has_many :biddings
  # Settable attributes. Mainly implemented in iteration 1.total_quantity and quantity added in Iteration 3, buyer_id discarded.
  attr_accessible :total_quantity, :category, :condition, :description, :duration, :price, :title, :user_id, :product, :quantity, :active, :isAdvertisement
  has_attached_file :product, :styles => { :medium => "300x300>", :thumb => "100x100>" }


# Validations for all the attributes.
begin
  validates :title,  presence: true, length: { maximum: 50 }
  validates :category,  presence: true, length: { maximum: 50 }
  validates :condition,  presence: true, length: { maximum: 50 }
  validates :description,  presence: true, length: { maximum: 50 }

  #validates :duration,  presence: true, length: { maximum: 8 }
  #validates_length_of :duration, :in => 1..32
  #validates_numericality_of :duration

  validates :price,  presence: true, length: { maximum: 8 }
  validates_length_of :price, :in => 1..32
  validates_numericality_of :price
  validates :quantity,  presence: true, numericality: true, inclusion: {:in => 0..65535}
  validates :total_quantity,  presence: true, numericality: true, inclusion: {:in => 1..65535}
  validates :isAdvertisement , :inclusion => {:in => [true, false]}#, inclusion: {:in => 0..1}
end

end
