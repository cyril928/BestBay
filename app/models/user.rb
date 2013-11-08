class User < ActiveRecord::Base
  has_many :items
  has_many :biddings
  has_one :shopping_cart
  has_many :transactions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :street, :country, :zip, :phone
  # attr_accessible :title, :body


  before_save { email.downcase! }


  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  validates :street,  presence: true, length: { maximum: 50 }
  validates :country,  presence: true, length: { maximum: 50 }

  validates :zip,  presence: true, length: { maximum: 50 }
  validates_length_of :zip, :in => 5..10
  validates_numericality_of :zip

  validates :phone,  presence: true, length: { maximum: 50 }
  validates_length_of :phone, :in => 7..32
  validates_numericality_of :phone

=begin
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  after_validation { self.errors.messages.delete(:password_digest) }
=end


end
