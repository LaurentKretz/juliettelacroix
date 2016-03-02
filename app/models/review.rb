# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  grade1     :integer
#  grade2     :integer
#  grade3     :integer
#  comment    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  perfume_id :integer
#

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :perfume
  validates :user_id, presence: :true
  validates :perfume_id, presence: :true

end
