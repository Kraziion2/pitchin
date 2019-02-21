class Article < ApplicationRecord
	has_many :agreements
	has_many :users , through: :agreements

	def find_users article
		users = article.users
		users
	end
	def agreement_date article ,user
		agr=Agreement.where(article_id:article.id,user_id:user.id)
		date = agr[0].created_at
		date
	end	
	def reject_Agreement article,user
	end	
end
