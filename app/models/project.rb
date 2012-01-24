class Project < ActiveRecord::Base
  validates :name, :presence => true
  
  has_many :lists
  has_many :collaborations
  has_many :users, :through => :collaborations
  
  belongs_to :author, :class_name => 'User'
end
