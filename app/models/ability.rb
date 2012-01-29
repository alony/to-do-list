class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Project, :author_id => user.id unless user.new_record?
    can :read, Project do |project|
      project.users.include? user
    end
    [Task, List].each do |klass|
      can :manage, klass do |obj|
        user.projects.include? obj.project
      end
    end
    can :delete, Collaboration do |rec|
      rec.project.author == user
    end
  end
end

