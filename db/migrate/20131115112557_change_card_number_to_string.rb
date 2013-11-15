class ChangeCardNumberToString < ActiveRecord::Migration
  def up
    change_column :transactions, :card_number, :string
  end

  def down
    change_column :transactions, :card_number, :integer
  end
end
