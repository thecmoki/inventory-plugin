require 'securerandom'
class Unit < ActiveRecord::Base
	


	require 'securerandom'
	belongs_to(:category)
	has_many(:inventories)
	validates(:category_id, :presence => true)
	validates :name, :presence => true
	validates :comment, :length => { :maximum => 100}
	validates_uniqueness_of :productid	
	
end