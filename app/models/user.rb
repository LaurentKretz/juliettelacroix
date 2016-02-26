class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews
  has_many :orders
  has_many :addresses
  has_many :order_items, through: :orders
  has_one :coupon

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :email, presence: :true

  accepts_nested_attributes_for :addresses
end
