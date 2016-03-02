# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :integer
#

class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
  end
end
