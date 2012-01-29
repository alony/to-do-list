class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  delegate :email, :to => :user, :allow_nil => true
end

