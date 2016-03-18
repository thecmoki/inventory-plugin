class AddColorToHistory < ActiveRecord::Migration
	def change
		add_column(:histories, :color, :string)
	end
	def down
		remove_column(:histories, :color)
	end
end