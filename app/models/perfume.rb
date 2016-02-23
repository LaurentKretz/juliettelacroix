class Perfume < ActiveRecord::Base
  has_many :reviews, :samples
  has_many :order_items, as: :product
end
