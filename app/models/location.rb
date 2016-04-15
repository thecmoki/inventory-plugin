class Location < ActiveRecord::Base
	has_many(:rooms)
	validates(:name, :presence => true, :uniqueness => true)
	validates(:prefix, :presence => true, :uniqueness => true)
end
