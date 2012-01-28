class Mailer < ActionMailer::Base
  default :from => "info@todolist.com"

  def invite(email, project)
    mail(:to => email, :subject => "Registered")
  end
end

