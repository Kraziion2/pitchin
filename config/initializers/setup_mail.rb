
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
