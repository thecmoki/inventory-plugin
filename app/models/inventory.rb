class Inventory < ActiveRecord::Base
	belongs_to(:user)
	belongs_to(:room)
	belongs_to(:unit)
	belongs_to(:amortnorm)
	has_many(:histories)
	validates(:user_name, :presence => true)
	validates(:room_name, :presence => true)
	validates(:product_name, :presence => true)
	validates(:product_id, :presence => true)
	validates(:serial_number, :presence => true, :uniqueness => true)
	validates(:activation_date, :presence => true)
	def self.ransackable_attributes(auth_object = nil)
		if(User.current.admin == true)
			super - ['id', 'created_at', 'updated_at']
		else
			super - ['id', 'created_at', 'updated_at', 'user_name', 'room_name', 'user_login']
		end
	end
	def toDays
		years = Time.now.year - activation_date.year
		yd = years * 365.25
		months = Time.now.month - activation_date.month
		md = (months / 12.0) * 365.25
		days = Time.now.day - activation_date.day
		(yd + md + days).to_i
	end
end