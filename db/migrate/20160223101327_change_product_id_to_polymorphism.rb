class ChangeProductIdToPolymorphism < ActiveRecord::Migration
  def change
    remove_column :order_items, :product_id
    add_reference :order_items, :product, polymorphic: true, index: true
  end
end
