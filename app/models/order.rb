class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :address
  has_many :order_items
  validates :user_id, presence: :true
  validates :address_id, presence: :true
end
