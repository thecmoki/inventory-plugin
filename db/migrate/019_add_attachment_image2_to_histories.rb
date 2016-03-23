class AddAttachmentImage2ToHistories < ActiveRecord::Migration
  def self.up
  	change_table :histories do |t|
    	t.attachment :image2
    end
  end

  def self.down
    remove_attachment :histories, :image2
  end
end