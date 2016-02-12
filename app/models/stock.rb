class Stock < ActiveRecord::Base
	belongs_to(:unit)
	belongs_to(:category)
	
	has_many(:inventories)
	validates(:category_id, :presence => true)
	validates(:unit_id, :presence => true)	
end