# == Schema Information
#
# Table name: kits
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Kit < ActiveRecord::Base
  has_many :order_items, as: :product
  has_many :samples
  has_many :perfumes, through: :samples
  monetize :price_cents

  validates :name, presence: :true

  def self.current
    # TODO: find the current kit
    Kit.first
  end
end
