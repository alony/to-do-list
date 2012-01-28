class Project < ActiveRecord::Base
  validates :name, :presence => true

  has_many :lists, :dependent => :destroy
  has_many :tasks, :through => :lists
  has_many :collaborations
  has_many :users, :through => :collaborations

  belongs_to :author, :class_name => 'User'

  def collaborators
    users.all << author
  end
end

