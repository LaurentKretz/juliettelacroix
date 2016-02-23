class Order < ActiveRecord::Base
  belongs_to :user, :address
  has_many :order_items
end
