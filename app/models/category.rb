class Category < ActiveRecord::Base
	has_many :units, :dependent => :destroy
	validates :name, :presence => true
	validates :comment, :length => { :maximum => 100}
	validates :prefixid, presence: true, uniqueness: true

	def uniquecode
          raw_string = SecureRandom.random_number( 2**80 ).to_s( 20 ).reverse
          long_code = raw_string.tr( '0123456789abcdefghij', '234679QWERTYUPADFGHX' )
          self.prefixid+'-'+long_code[4..7]+'-'+long_code[8..11]
  	end
end