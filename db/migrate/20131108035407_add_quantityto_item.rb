class AddQuantitytoItem < ActiveRecord::Migration
  def up
    add_column :items, :quantity, :integer
  end

  def down
    remove_column :items, :quantity, :integer
  end
end
