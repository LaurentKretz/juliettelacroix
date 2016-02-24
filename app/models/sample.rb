class Sample < ActiveRecord::Base
  belongs_to :perfume
  belongs_to :kit
  validates :perfume_id, presence: :true
  validates :kit_id, presence: :true

end
