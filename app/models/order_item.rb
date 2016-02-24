class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product, polymorphic: :true
  validates :order_id, presence: :true
  validates :product_id, presence: :true
  scope :kit, -> {where(product_type: "Kit")}
  scope :perfume, -> {where(product_type: "Perfume")}
end
