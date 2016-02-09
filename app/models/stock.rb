class Stock < ActiveRecord::Base
	belongs_to(:category)
	belongs_to(:unit)
	has_many(:inventories)
end