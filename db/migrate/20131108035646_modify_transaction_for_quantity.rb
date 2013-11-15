class ModifyTransactionForQuantity < ActiveRecord::Migration
  def up
    add_column :transactions, :user_id, :integer
    remove_column :transactions, :item_id
    add_column :transactions, :item_list, :string
  end

  def down
    remove_column :transactions, :user_id
    add_column :transactions, :item_id, :integer
    remove_column :transactions, :item_list
  end
end
