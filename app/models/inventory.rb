class Inventory < ActiveRecord::Base
	belongs_to(:stock)
	belongs_to(:user)
	belongs_to(:room)
	validates(:room_id, :presence => true)
	validates(:user_id, :presence => true)
	validates(:stock_id, :presence => true)
end