class EmailConfirmation < ActionMailer::Base
  #TODO: Change default email addresses after getting domain
  default :from => 'noreply.jobly@gmail.com'

  def confirm_email(recipient)
    @user = recipient
    mail(to: recipient.email, subject: 'Welcome to Jobly')
  end
end
