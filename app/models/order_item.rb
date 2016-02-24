class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product, polymorphic: :true
  scope :kit, -> {where(product_type: "Kit")}
  scope :kit, -> {where(product_type: "Perfume")}
  validates :order_id, presence: :true
  validates :product_id, presence: :true
end
