class ChangeActiveFieldType < ActiveRecord::Migration
  def up
    change_column :users, :active, :integer
    change_column :items, :active, :integer
  end

  def down
    change_column :users, :active, :boolean
    change_column :items, :active, :boolean
  end
end
