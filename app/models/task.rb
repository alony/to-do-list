class Task < ActiveRecord::Base
  enum_attr :status, ['New', 'In progress', 'Resolved']
  
  validates :name, :list_id, :presence => true
  validates :priority, :numericality => { :only_integer => true }, :inclusion => (1..5)
  
  belongs_to :list
  belongs_to :author, :class_name => 'User'
  belongs_to :assigned, :class_name => 'User'
end
