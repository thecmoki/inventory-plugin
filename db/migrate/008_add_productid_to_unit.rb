class AddProductidToUnit < ActiveRecord::Migration
	def change
		add_column :units, :productid, :string
	end
	def down
		remove_column :units, :productid
	end
end
