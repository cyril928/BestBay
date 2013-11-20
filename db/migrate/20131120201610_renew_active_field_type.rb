class RenewActiveFieldType < ActiveRecord::Migration
  def change
    remove_column :items, :active
    remove_column :users, :active
    add_column :users, :active, :integer
    add_column :items, :active, :integer
  end
end
