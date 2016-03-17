class Amortnorm < ActiveRecord::Base
  has_many(:units)
  validates(:name, :presence => true, :numericality => {:greater_than => -1, :less_than => 101})
end