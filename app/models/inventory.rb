class Inventory < ActiveRecord::Base
	belongs_to(:stock)
	belongs_to(:user)
	belongs_to(:room)

	
end