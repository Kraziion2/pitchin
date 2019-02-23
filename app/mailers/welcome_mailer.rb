class WelcomeMailer < ApplicationMailer
	def welcome_send(user)
		@user=user
		mail to: user.email,subject: "Welcome to my site" ,from: "bartoszgrabczak192@gmail.com"
	end

end
