class Article < ApplicationRecord
	paginates_per 4
	validates :title ,:description,:recruiting,:skills,:employability,:country,:city,:street ,presence:true
	has_many :agreements
	has_many :users , through: :agreements
	geocoded_by :address
  	after_validation :geocode
  	def address
  		[street,city,country].compact.join(', ')
  	end
	def find_users article
		users = article.users
		users
	end
	def agreement_date article ,user
		agr=Agreement.where(article_id:article.id,user_id:user.id)
		date = agr[0].created_at
		date
	end	
	def cancel_agreement article
		@agreements = Agreement.where(article_id:article.id)
		for agr in @agreements 
			user = User.find_by(id:agr.user_id)
			user.articles.delete(article.id)
		end	
	end	
end
