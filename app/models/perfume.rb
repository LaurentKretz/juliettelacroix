class Perfume < ActiveRecord::Base
  has_many :reviews
  has_many :samples
  has_many :order_items, as: :product
end
