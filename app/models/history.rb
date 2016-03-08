class History < ActiveRecord::Base
  belongs_to(:user)
  belongs_to(:inventory)
  def self.ransackable_attributes(auth_object = nil)
		if(User.current.admin == true)
			super - ['id', 'created_at', 'updated_at']
		else
			super - ['id', 'created_at', 'updated_at', 'user_name', 'room_name', 'user_login']
		end
	end

	def toDays
		years = updated_at.year - activation_date.year
		yd = years * 365.25
		months = updated_at.month - activation_date.month
		md = (months / 12.0) * 365.25
		days = updated_at.day - activation_date.day
		(yd + md + days).to_i
	end
end