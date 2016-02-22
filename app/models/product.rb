class Product < ActiveRecord::Base
  belongs_to :perfume
  belongs_to :kit
  has_many :order_items
end
