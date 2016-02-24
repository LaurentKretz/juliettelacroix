class RemoveColumnsFromuser < ActiveRecord::Migration
  def change
    remove_column :users, :address
    remove_column :users, :address_details
  end
end
