class AddRatingColumnToItem < ActiveRecord::Migration
  def change
    add_column :items, :average_rating, :integer
  end
end
