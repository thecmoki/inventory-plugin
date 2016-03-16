class AddColorToInventory < ActiveRecord::Migration
	def change
		add_column(:inventories, :color, :string)
	end
	def drop
		remove_column(:inventories, :color)
	end
end