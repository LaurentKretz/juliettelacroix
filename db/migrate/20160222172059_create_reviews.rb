class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :grade1
      t.integer :grade2
      t.integer :grade3
      t.text :comment
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
