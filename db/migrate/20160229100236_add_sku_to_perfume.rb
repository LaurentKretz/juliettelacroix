class AddSkuToPerfume < ActiveRecord::Migration
  def change
    add_column :perfumes, :sku, :string
  end
end
