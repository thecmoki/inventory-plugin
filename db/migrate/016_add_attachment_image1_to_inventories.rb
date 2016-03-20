class AddAttachmentImage1ToInventories < ActiveRecord::Migration
  def self.up
  	change_table :inventories do |t|
    	t.attachment :image1
    end
  end

  def self.down
    remove_attachment :inventories, :image1
  end
end