class RenameCardnumDateofexpire < ActiveRecord::Migration
  def up
    change_table :transactions do |t|
      t.rename :cardnum, :card_number
      t.rename :dateofexpire, :expiry_date
    end
  end

  def down
    change_table :transactions do |t|
      t.rename :card_number, :cardnum
      t.rename :expiry_date, :dateofexpire
    end
  end
end
