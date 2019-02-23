
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
