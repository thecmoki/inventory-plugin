class AddPrefixidToCategory < ActiveRecord::Migration
	def change
		add_column :categories, :prefixid, :string
	end
	def down
		remove_column :categories, :prefixid
	end
end
