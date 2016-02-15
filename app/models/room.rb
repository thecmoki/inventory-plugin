class Room < ActiveRecord::Base
	has_many(:inventories)

	attr_accessible :name, :comment

	validates :name, :presence => true
	validates :comment, :length => { :maximum => 100}

end