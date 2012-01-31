class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  attr_accessible :password, :password_confirmation, :email, :name

  has_many :lists
  has_many :tasks_to_do, :class_name => 'Task', :foreign_key => 'assigned_id'
  has_many :collaborations

  def projects
    collaborations.map(&:project) | Project.where(:author_id => id)
  end

  def username
    name.blank? ? email : name
  end

  def generate_pwd!
    self.password = self.password_confirmation = ActiveSupport::SecureRandom.base64(6)
  end
end

