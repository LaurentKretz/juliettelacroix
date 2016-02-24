class AddFirstPurchaseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_purchase, :boolean, default: false
  end
end
