class CancelApprovalMailer < ApplicationMailer
	def cancel_approval(user,article)
		@user=user
		@article = article
		mail to: user.email,subject: "Reject for Article" ,from: "bartoszgrabczak192@gmail.com"
	end

	def employee_cancel(user,article,employee)
		@user=employee
		@owner = user
		@article = article
		mail to: user.email,subject: "Employee Cancel  Article" ,from: "bartoszgrabczak192@gmail.com"
	end

end
