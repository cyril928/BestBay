class ChangeItemListinShoppingCartandTransaction < ActiveRecord::Migration
  def up
    change_column :shopping_carts, :item_list, :text
    change_column :transactions, :item_list, :text
  end

  def down
    change_column :shopping_carts, :item_list, :string
    change_column :transactions, :item_list, :string
  end
end
