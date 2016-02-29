class AddMonetizeToOrderItems < ActiveRecord::Migration
  def change
    add_monetize :order_items, :amount, currency: { present: false }
  end
end
