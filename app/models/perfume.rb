# == Schema Information
#
# Table name: perfumes
#
#  id           :integer          not null, primary key
#  name         :string
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  introduction :text
#  inspiration  :text
#  note1        :text
#  note2        :text
#

class Perfume < ActiveRecord::Base
  has_many :reviews
  has_many :samples
  has_many :order_items, as: :product
  validates :name, presence: :true
  monetize :price_cents
end
