class Stock < ActiveRecord::Base
	belongs_to(:category)
	belongs_to(:unit)
	has_many(:inventories)
	validates(:category_id, :presence => true)
	validates(:unit_id, :presence => true)	
end