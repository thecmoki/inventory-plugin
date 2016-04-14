class Room < ActiveRecord::Base
	belongs_to(:location)
	has_many :inventories, :dependent => :destroy
	validates :name, :presence => true
end