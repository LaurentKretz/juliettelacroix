class AddColumnsToPerfume < ActiveRecord::Migration
  def change
    add_column :perfumes, :introduction, :text
    add_column :perfumes, :inspiration, :text
    add_column :perfumes, :note1, :text
    add_column :perfumes, :note2, :text
  end
end
