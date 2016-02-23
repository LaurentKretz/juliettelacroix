class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :address
  has_many :order_items
end
