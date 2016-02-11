class Category < ActiveRecord::Base
	has_many(:stocks)

	validates :name, presence: true, :format => {:with => /[a-zA-Z]+/ }
	validates :comment, presence: true
end