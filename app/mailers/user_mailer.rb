class UserMailer < ActionMailer::Base
  default from: "noreply@run.imranismail.me"
  
  def welcome_email(user)
    @user = user
    @url  = sign_in_url
    mail(to: @user.email, subject: 'Thanks for signing up')
  end
end
