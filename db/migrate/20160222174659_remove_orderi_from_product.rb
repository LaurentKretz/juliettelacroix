class RemoveOrderiFromProduct < ActiveRecord::Migration
  def change
    remove_reference :products, :order_item, index: true, foreign_key: true
  end
end
