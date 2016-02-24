class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :perfume
  validates :user_id, presence: :true
  validates :perfume_id, presence: :true

end
