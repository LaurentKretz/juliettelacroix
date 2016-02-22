class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.integer :number
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
