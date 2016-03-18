class AddUnitidToInventory < ActiveRecord::Migration
	def change
		add_column :inventories, :unit_id, :integer
	end
	def down
		remove_column :inventories, :unit_id
	end
end