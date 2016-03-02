# == Schema Information
#
# Table name: order_items
#
#  id           :integer          not null, primary key
#  quantity     :integer
#  order_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  product_id   :integer
#  product_type :string
#

class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product, polymorphic: :true
  validates :order_id, presence: :true
  validates :product_id, presence: :true
  scope :kit, -> {where(product_type: "Kit")}
  scope :perfume, -> {where(product_type: "Perfume")}
  monetize :amount_cents
end
