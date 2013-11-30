class AddRewardPointsSpentToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :reward_points_spent, :integer
    rename_column :transactions, :reward_points, :reward_points_earned
  end
end
