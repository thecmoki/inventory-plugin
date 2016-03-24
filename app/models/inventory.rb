class Inventory < ActiveRecord::Base
	belongs_to(:user)
	belongs_to(:room)
	belongs_to(:unit)
	has_many(:histories)
	has_attached_file :image1, styles: { medium: "300x300>", thumb: "20x20>" }
	validates_attachment_content_type :image1, content_type: /\Aimage\/.*\Z/

	has_attached_file :image2, styles: { medium: "300x300>", thumb: "20x20>" }
	validates_attachment_content_type :image2, content_type: /\Aimage\/.*\Z/

	validates(:user_name, :presence => true)
	validates(:room_name, :presence => true)
	validates(:product_name, :presence => true)
	validates :product_id, :uniqueness => true
	validates(:serial_number, :presence => true, :uniqueness => true, format: { with: /\A[a-zA-Z0-9]+\z/})
	validates(:activation_date, :presence => true)
	validates(:neto_value, presence: true, :numericality => {:greater_than => -1})
	validates(:buy_date, :presence => true)
	
	def self.ransackable_attributes(auth_object = nil)
		if(User.current.admin == true)
			super - ['id', 'created_at', 'updated_at', 'time_of_use', 'comment', 'image1_file_name', 'image1_content_type', 'image1_file_size', 'image1_updated_at', 'image2_file_name', 'image2_content_type', 'image2_file_size', 'image2_updated_at']
		else
			super - ['id', 'created_at', 'updated_at', 'user_name', 'room_name', 'user_login', 'time_of_use', 'comment', 'image1_file_name', 'image1_content_type', 'image1_file_size', 'image1_updated_at', 'image2_file_name', 'image2_content_type', 'image2_file_size', 'image2_updated_at']
		end
	end

	def days
		(Time.now.to_date - activation_date).to_i
		#self.update_attributes(:time_of_use => "#{(Time.now.to_date - activation_date)}")
	end
end