class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :type
      t.references :perfume, index: true, foreign_key: true
      t.references :kit, index: true, foreign_key: true
      t.references :order_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
