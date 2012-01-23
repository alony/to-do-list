class Mailer < ActionMailer::Base
  default :from => "info@textbuster.com"
  
  def registered(user, password)
    @user, @pwd = user, password
    mail(:to => user.email, :subject => "Registered")  
  end
end
