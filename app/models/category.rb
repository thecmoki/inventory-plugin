class Category < ActiveRecord::Base
	has_many(:units)

	validates :name, :presence => true
	validates :comment, :length => { :maximum => 100}
end