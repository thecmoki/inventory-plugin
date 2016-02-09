class Category < ActiveRecord::Base
	has_many(:stocks)
end