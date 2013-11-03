class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name
      t.integer :cardnum
      t.string :dateofexpire
      t.string :address

      t.timestamps
    end
  end
end
