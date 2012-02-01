class Task < ActiveRecord::Base
  enum_attr :status, [:new, :"in progress", :resolved]

  validates :name, :list_id, :presence => true
  validates :priority, :numericality => { :only_integer => true }, :inclusion => (1..5)

  belongs_to :list
  belongs_to :author, :class_name => 'User'
  belongs_to :assigned, :class_name => 'User'
  delegate :project, :to => :list

  scope :done, where(:status => 'resolved')
  scope :to_do, where{status != :resolved}
  
  after_save :notify
  
  private
  def notify
    if assigned_id_changed?
      Mailer.delay.reassign(assigned, self)
    elsif status_changed?
      Mailer.delay.status(assigned, author, self)
    end
  end
end

