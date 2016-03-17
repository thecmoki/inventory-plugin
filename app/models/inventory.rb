class Inventory < ActiveRecord::Base
	belongs_to(:user)
	belongs_to(:room)
	belongs_to(:unit)
	has_many(:histories)
	#validates(:user_name, :presence => true)
	validates(:room_name, :presence => true)
	validates(:product_name, :presence => true)
	#validates(:product_id, :presence => true)
	validates(:serial_number, :presence => true, :uniqueness => true, format: { with: /\A[a-zA-Z0-9]+\z/})
	validates(:activation_date, :presence => true)
	validates(:neto_value, presence: true, :numericality => {:greater_than => -1})
	def self.ransackable_attributes(auth_object = nil)
		if(User.current.admin == true)
			super - ['id', 'created_at', 'updated_at', 'time_of_use', 'comment']
		else
			super - ['id', 'created_at', 'updated_at', 'user_name', 'room_name', 'user_login', 'time_of_use', 'comment']
		end
	end
	
	def days
		((Time.now.to_date - activation_date)).to_i
	end
end