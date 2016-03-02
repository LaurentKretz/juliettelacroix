# == Schema Information
#
# Table name: coupons
#
#  id         :integer          not null, primary key
#  number     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Coupon < ActiveRecord::Base
  belongs_to :user
end
