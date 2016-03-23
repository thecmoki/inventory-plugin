class AddAttachmentImage1ToHistories < ActiveRecord::Migration
  def self.up
  	change_table :histories do |t|
    	t.attachment :image1
    end
  end

  def self.down
    remove_attachment :histories, :image1
  end
end