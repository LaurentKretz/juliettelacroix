class Kit < ActiveRecord::Base
  has_many :order_items, as: :product
  has_many :samples
  has_many :perfumes, through: :samples
  validates :name, presence: :true
end
