class AddAttachmentImage2ToInventories < ActiveRecord::Migration
  def self.up
  	change_table :inventories do |t|
    	t.attachment :image2
    end
  end

  def self.down
    remove_attachment :inventories, :image2
  end
end