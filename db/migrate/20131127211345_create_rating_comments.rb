class CreateRatingComments < ActiveRecord::Migration
  def change
    create_table :rating_comments do |t|
      t.integer :user_id
      t.integer :seller_id
      t.integer :item_id
      t.integer :rating
      t.string :comment
      t.integer :is_seller_rating

      t.timestamps
    end
  end
end
