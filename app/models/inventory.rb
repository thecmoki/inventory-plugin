class Inventory < ActiveRecord::Base
	belongs_to(:user)
	belongs_to(:room)
	belongs_to(:unit)
	validates(:user_name, :presence => true)
	validates(:room_name, :presence => true)
	validates(:product_name, :presence => true)
	def self.ransackable_attributes(auth_object = nil)
		super - ['id', 'created_at', 'updated_at']
	end
end