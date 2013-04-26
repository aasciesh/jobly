
#TODO: Change these settings to production mail server before putting into production
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain				=> "gmail.com",
  :user_name            => "noreply.jobly",
  :password             => "harlemshake",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

#TODO: Change host to real domain name before putting into production
ActionMailer::Base.default_url_options[:host] = "localhost:3000"