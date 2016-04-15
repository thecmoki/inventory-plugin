class Room < ActiveRecord::Base
	belongs_to(:location)
	has_many(:inventories, :dependent => :destroy)
	validates(:name, :presence => true, :uniqueness => true)
	validates(:prefix_id, :presence => true)
	validates(:location_id, :presence => true)
end