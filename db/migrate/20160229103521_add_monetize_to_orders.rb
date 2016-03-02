class AddMonetizeToOrders < ActiveRecord::Migration
  def change
    add_monetize :orders, :amount, currency: { present: false }
  end
end
