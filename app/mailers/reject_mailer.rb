class RejectMailer < ApplicationMailer
	def reject_user(user,article)
		@user=user
		@article = article
		mail to: user.email,subject: "Reject for Article" ,from: "bartoszgrabczak192@gmail.com"
	end

end
