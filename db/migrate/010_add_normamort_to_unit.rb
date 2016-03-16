class AddNormamortToUnit < ActiveRecord::Migration
	def change
		add_column :units, :normamort, :string
	end
	def down
		remove_column :units, :normamort
	end
end