class Category < ActiveRecord::Base
	has_many :units, :dependent => :destroy
	validates :name, :presence => true
	validates :prefixid, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/}

def err

end

	def uniquecode
          raw_string = SecureRandom.random_number( 2**80 ).to_s( 20 ).reverse
          long_code = raw_string.tr( '0123456789abcdefghij', '234679QWERTYUPADFGHX' )
          self.prefixid+'-'+long_code[4..7]+'-'+long_code[8..11]
  	end
end