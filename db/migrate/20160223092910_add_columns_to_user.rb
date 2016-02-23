class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :address_details, :string
  end
end
