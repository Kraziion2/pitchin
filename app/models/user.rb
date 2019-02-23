class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username ,presence:true
  has_one :profile 
  has_many :agreements
  has_many :articles ,through: :agreements
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send     
  def welcome_send
		WelcomeMailer.welcome_send(self).deliver
	end
  def agreement_found article_id
    @agreement = self.agreements
    found = false
    @agreement.each do |agre|
      if agre.article_id == article_id
        found =  true
      end 
    end
    found
  end 
  def approval_found article_id
    @approval = Approval.find_by(article_id: article_id)
    found = false
    found = true if @approval
  end 
	
end
