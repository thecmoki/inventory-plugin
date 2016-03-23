class History < ActiveRecord::Base
  belongs_to(:user)
  belongs_to(:inventory)

	has_attached_file :image1, styles: { medium: "300x300>", thumb: "20x20>" }
	validates_attachment_content_type :image1, content_type: /\Aimage\/.*\Z/

	has_attached_file :image2, styles: { medium: "300x300>", thumb: "20x20>" }
	validates_attachment_content_type :image2, content_type: /\Aimage\/.*\Z/

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