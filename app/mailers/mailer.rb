class Mailer < ActionMailer::Base
  include ActionView::Helpers::TextHelper
  
  default :from => "info@todolist.com"

  def invite(user, project_name, pwd)
    @user, @project_name, @pwd = user, project_name, pwd
    mail(:to => @user.email, :subject => "You were invited to the project #{@project_name}")
  end
  
  def reassign(user, task)
    @user, @task = user, task
    mail(:to => @user.email, :subject => "Task #{truncate(@task.name, length: 15)} was assigned to you")
  end
  
  def status(assigned, author, task)
    @users = [assigned, author].uniq
    @task = task
    mail(:to => @users.map(&:email), :subject => "Task #{truncate(@task.name, length: 15)} status changed to #{task.status}")
  end
end

