class RemoveFirstPurchaseFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :first_purchase, :boolean
  end
end
