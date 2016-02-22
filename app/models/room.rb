class Room < ActiveRecord::Base
	has_many(:inventories)

	validates :name, :presence => true
	validates :comment, :length => { :maximum => 100}

end