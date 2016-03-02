# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :integer
#

class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :address
  has_many :order_items
  validates :user_id, presence: :true
  validates :address_id, presence: :true
  monetize :amount_cents

end
