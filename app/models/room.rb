class Room < ActiveRecord::Base
	has_many(:inventories)
end