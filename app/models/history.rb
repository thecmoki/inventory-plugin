class History < ActiveRecord::Base
  belongs_to(:user)
  belongs_to(:inventory)
  def self.ransackable_attributes(auth_object = nil)
		if(User.current.admin == true)
			super - ['id', 'created_at', 'updated_at', 'inventory_id', 'time_of_use', 'comment']
		else
			super - ['id', 'created_at', 'updated_at', 'user_name', 'room_name', 'user_login', 'inventory_id', 'time_of_use', 'comment']
		end
	end

	def days
		((updated_at.to_date - activation_date)).to_i
	end
end