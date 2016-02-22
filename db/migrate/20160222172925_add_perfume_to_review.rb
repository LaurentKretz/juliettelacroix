class AddPerfumeToReview < ActiveRecord::Migration
  def change
    add_reference :reviews, :perfume, index: true, foreign_key: true
  end
end
