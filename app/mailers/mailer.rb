class Mailer < ActionMailer::Base
  default :from => "info@todolist.com"

  def invite(user)
    @user = user
    mail(:to => user.email, :subject => "You were invited to the project")
  end
end

