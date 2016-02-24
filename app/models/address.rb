class Address < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  validates :first_name, :last_name, :street, :city, presence: :true
  validates :user_id, presence: :true
end
