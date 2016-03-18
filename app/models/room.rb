class Room < ActiveRecord::Base
	has_many :inventories, :dependent => :destroy
	validates :name, :presence => true
end