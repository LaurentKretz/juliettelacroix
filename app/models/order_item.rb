class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product, polymorphic: :true
  scope :kit, -> {where(product_type: "Kit")}
end
