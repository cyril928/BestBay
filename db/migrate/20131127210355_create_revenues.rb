class CreateRevenues < ActiveRecord::Migration
  def change
    create_table :revenues do |t|
      t.integer :user_id
      t.integer :item_id
      t.string :name
      t.string :card_number
      t.string :expiry_date
      t.string :address
      t.integer :amount
      t.integer :is_transaction_revenue

      t.timestamps
    end
  end
end
