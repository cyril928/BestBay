class UserMailer < ActionMailer::Base
  default from: "risingfalcons19@gmail.com"


  def signup_notify(user)
    @user = user

    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
