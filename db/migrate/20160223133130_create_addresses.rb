class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.integer :zip_code
      t.string :city
      t.string :country_code
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
