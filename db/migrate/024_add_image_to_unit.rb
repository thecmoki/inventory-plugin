class AddImageToUnit < ActiveRecord::Migration
	def change
		add_column :units, :image, :json
	end
	def down
		remove_column :units, :image
	end
end