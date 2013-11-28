class AddRewardPointForUser < ActiveRecord::Migration
  def change
    add_column :users, :reward_points, :integer
    add_column :transactions, :reward_points, :integer
  end
end
