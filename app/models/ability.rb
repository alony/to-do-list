class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    unless user.new_record?
      can :manage, Project, :author_id => user.id
      can :read, Project do |project|
        project.users.include? user
      end
      [Task, List].each do |klass|
        can :manage, klass do |obj|
          obj.new_record? || user.projects.include?(obj.project)
        end
      end
      can :delete, Collaboration do |rec|
        rec.project.author == user
      end
    end
  end
end

