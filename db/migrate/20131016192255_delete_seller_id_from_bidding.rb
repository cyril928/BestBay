class DeleteSellerIdFromBidding < ActiveRecord::Migration
  def up
    remove_column :biddings, :seller_id
  end

  def down
  end
end
