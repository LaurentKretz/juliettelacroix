class AddSkuToKits < ActiveRecord::Migration
  def change
    add_column :kits, :sku, :string
  end
end
