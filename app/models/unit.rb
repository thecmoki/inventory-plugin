class Unit < ActiveRecord::Base
	belongs_to :project
	
	 #acts_as_watchable	
	 acts_as_attachable :view_permission => :view_units
	 # 					:edit_permission => :view_attachments,
	 # 					:delete_permission => :view_attachments
                    
	 				#:view_permission => :view_attachments, 
                    
                    #:view_permission => :read_authorize
                    #:delete_permission => :view_attachments
	

	belongs_to(:category)
	belongs_to(:amortnorm)
	has_many :inventories, :dependent => :destroy
	validates(:category_id, :presence => true)
	validates(:normamort, :presence => true)
	validates :name, :presence => true, :uniqueness => true
	validates(:quantity, :presence => true, :numericality => {:greater_than => 0, :only_integer => true})
end