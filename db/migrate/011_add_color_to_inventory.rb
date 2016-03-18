class AddColorToInventory < ActiveRecord::Migration
	def change
		add_column(:inventories, :color, :string)
	end
	def down
		remove_column(:inventories, :color)
	end
end