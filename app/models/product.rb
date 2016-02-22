class Product < ActiveRecord::Base
  belongs_to :perfume
  belongs_to :kit
  belongs_to :OrderItem
end
