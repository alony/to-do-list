# User model
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  attr_accessible :password, :password_confirmation, *(column_names rescue [])

  has_many :lists
  has_many :tasks
  has_many :collaborations
  has_many :projects, :through => :collaborations  
  
  def username
    name || email
  end
  
  def tasks_to_do
    Task.where(:assigned_id => id)
  end
end
