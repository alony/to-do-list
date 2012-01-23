class Project < ActiveRecord::Base
  validates :name, :presence => true
  
  has_many :lists
  has_many :collaborations
  has_many :users, :through => :collaborations
  
end
