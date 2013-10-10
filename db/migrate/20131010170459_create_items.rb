class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :category
      t.string :description
      t.string :condition
      t.string :duration
      t.integer :price
      t.integer :user_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
