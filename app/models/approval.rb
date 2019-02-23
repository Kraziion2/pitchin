class Approval < ApplicationRecord
  belongs_to :user
  belongs_to :article

  def find_article approval
  	article = Article.find(approval.article_id)
  	article.owner_id
  end	
end
