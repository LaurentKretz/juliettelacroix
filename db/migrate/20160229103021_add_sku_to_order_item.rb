class AddSkuToOrderItem < ActiveRecord::Migration
  def change
    add_column :order_items, :product_sku, :string
  end
end
