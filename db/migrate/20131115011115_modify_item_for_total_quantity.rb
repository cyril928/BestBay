class ModifyItemForTotalQuantity < ActiveRecord::Migration
  def up
    rename_column :items, :buyer_id, :total_quantity
  end

  def down
    rename_column :items, :total_quantity, :buyer_id
  end
end
