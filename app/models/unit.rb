class Unit < ActiveRecord::Base
	belongs_to(:category)
	belongs_to(:amortnorm)
	has_many(:inventories)
	validates(:category_id, :presence => true)
	validates :name, :presence => true, :uniqueness => true
	validates :comment, :length => { :maximum => 100}
	validates(:normamort, :presence => true)
	validates(:productid, :uniqueness => true)
end