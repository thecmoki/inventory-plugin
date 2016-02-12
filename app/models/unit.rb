class Unit < ActiveRecord::Base
	has_many(:stocks)

	attr_accessible :name, :comment

	validates :name, :presence => true
	validates :comment, :length => { :maximum => 100}

		
end