class Review < ActiveRecord::Base
  belongs_to :user, :perfume
end
