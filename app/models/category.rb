class Category < ActiveRecord::Base
	has_many(:units)

	validates :name, presence: true, :format => {:with => /[a-zA-Z]+/ }
end