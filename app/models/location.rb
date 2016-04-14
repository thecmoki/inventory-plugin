class Location < ActiveRecord::Base
	has_many(:rooms)
	validates(:name, :presence => true)
end
