  class AddAttachmentProductToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :product
    end
  end

  def self.down
    drop_attached_file :items, :product
  end
end
