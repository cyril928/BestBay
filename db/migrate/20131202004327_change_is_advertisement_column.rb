class ChangeIsAdvertisementColumn < ActiveRecord::Migration
  def up
    remove_column :items, :isAdvertisement
    add_column :items, :is_advertisement, :integer
  end

  def down
    remove_column :items, :is_advertisement
    add_column :items, :isAdvertisement, :boolean
  end
end
