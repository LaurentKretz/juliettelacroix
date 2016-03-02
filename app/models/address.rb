# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
#  first_name   :string
#  last_name    :string
#  street       :string
#  zip_code     :integer
#  city         :string
#  country_code :string
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Address < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  validates :first_name, :last_name, :street, :city, presence: :true
  validates :user_id, presence: :true

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end

  def full_address
    "#{street}, #{zip_code} #{city}, #{country_name}"
  end
end
