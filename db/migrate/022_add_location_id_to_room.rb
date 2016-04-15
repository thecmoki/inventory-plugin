class AddLocationIdToRoom < ActiveRecord::Migration
	def change
		add_column :rooms, :location_id, :integer
	end
	def down
		remove_column :rooms, :location_id
	end
end