class AddMonetizeToKit < ActiveRecord::Migration
  def change
    add_monetize :kits, :price, currency: {present: false}
  end
end
