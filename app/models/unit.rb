require 'securerandom'
class Unit < ActiveRecord::Base
	require 'securerandom'
	belongs_to(:category)
	has_many(:inventories)
	validates(:category_id, :presence => true)
	validates :name, :presence => true
	validates :comment, :length => { :maximum => 100}	
	@unit = Unit.last
	def uniquecode
		@unit = Unit.last
		raw_string = SecureRandom.random_number( 2**80 ).to_s( 20 ).reverse
		long_code = raw_string.tr( '0123456789abcdefghij', '234679QWERTYUPADFGHX' )
		if @unit.category_id == 1
			"AA1"+'-'+long_code[4..7]+'-'+long_code[8..11]
		else 
			"AA2"+'-'+long_code[4..7]+'-'+long_code[8..11]
		end
	end
end