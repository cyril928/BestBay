class Item < ActiveRecord::Base
  belongs_to :user
  has_many :biddings
  attr_accessible :buyer_id, :category, :condition, :description, :duration, :price, :title, :user_id, :product, :quantity, :delete
  has_attached_file :product, :styles => { :medium => "300x300>", :thumb => "100x100>" }



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
  validates :quantity,  presence: true, numericality: true, inclusion: {:in => 1..65535}
end

end
