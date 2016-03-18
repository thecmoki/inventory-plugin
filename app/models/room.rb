class Room < ActiveRecord::Base
	has_many :inventories, :dependent => :destroy
	validates :name, :presence => true
	validates :comment, :length => { :maximum => 100}
end