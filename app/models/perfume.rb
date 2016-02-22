class Perfume < ActiveRecord::Base
  has_many :reviews, :samples, :products
end
