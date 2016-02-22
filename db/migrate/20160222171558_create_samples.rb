class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.references :perfume, index: true, foreign_key: true
      t.references :kit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
