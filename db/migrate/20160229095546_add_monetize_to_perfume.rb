class AddMonetizeToPerfume < ActiveRecord::Migration
  def change
    add_monetize :perfumes, :price, currency: {present: false}
  end
end
