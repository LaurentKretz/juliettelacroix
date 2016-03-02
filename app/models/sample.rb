# == Schema Information
#
# Table name: samples
#
#  id         :integer          not null, primary key
#  perfume_id :integer
#  kit_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sample < ActiveRecord::Base
  belongs_to :perfume
  belongs_to :kit
  validates :perfume_id, presence: :true
  validates :kit_id, presence: :true

end
