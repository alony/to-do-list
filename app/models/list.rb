class List < ActiveRecord::Base
  validates :name, :presence => true
  
  has_many :tasks
  belongs_to :project
  belongs_to :user
end
