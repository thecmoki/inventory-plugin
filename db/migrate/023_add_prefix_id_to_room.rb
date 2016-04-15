class AddPrefixIdToRoom < ActiveRecord::Migration
	def change
		add_column :rooms, :prefix_id, :string
	end
	def down
		remove_column :rooms, :prefix_id
	end
end