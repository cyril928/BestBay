class CreateBiddings < ActiveRecord::Migration
  def change
    create_table :biddings do |t|
      t.integer :item_id
      t.integer :seller_id
      t.integer :bidder_id
      t.integer :price

      t.timestamps
    end
  end
end
