class AddPictureToPerfume < ActiveRecord::Migration
  def change
    add_column :perfumes, :picture_url, :string
  end
end
