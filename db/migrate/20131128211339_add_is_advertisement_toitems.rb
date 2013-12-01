class AddIsAdvertisementToitems < ActiveRecord::Migration
  def change
    add_column  :items, :isAdvertisement, :boolean
  end
end
