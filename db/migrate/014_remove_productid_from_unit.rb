class RemoveProductidFromUnit < ActiveRecord::Migration
	def up
		remove_column :units, :productid
	end
	def down
		add_column :units, :productid, :string
	end
end