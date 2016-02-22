class CreatePerfumes < ActiveRecord::Migration
  def change
    create_table :perfumes do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
