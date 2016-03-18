class AddRoomidToInventory < ActiveRecord::Migration
	def change
		add_column :inventories, :room_id, :integer
	end
	def down
		remove_column :inventories, :room_id
	end
end