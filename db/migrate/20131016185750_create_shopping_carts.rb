class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.integer :buyer_id
      t.integer :item_id

      t.timestamps
    end
  end
end
