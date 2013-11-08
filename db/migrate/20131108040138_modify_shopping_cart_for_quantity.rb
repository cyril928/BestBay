class ModifyShoppingCartForQuantity < ActiveRecord::Migration
  def up
    rename_column :shopping_carts, :buyer_id, :user_id
    remove_column :shopping_carts, :item_id
    add_column :shopping_carts, :item_list, :string
  end

  def down
    rename_column :shopping_carts, :user_id, :buyer_id
    add_column :shopping_carts, :item_id, :integer
    remove_column :shopping_carts, :item_list
  end
end
