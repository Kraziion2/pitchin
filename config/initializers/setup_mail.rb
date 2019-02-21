
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              =>  'smtp.sendgrid.net',
  :port                 =>  587,
  :authentication       =>  :plain,
  :user_name            =>  'apikey',
  :password             =>  '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',
  :domain               =>  'heroku.com',
  :enable_starttls_auto  =>  true
}
