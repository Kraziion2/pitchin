class ArticlesController < InheritedResources::Base
require 'will_paginate/array' 
	before_action :authenticate_user! ,except:[:index,:show]
	def index
		if user_signed_in?
			if Profile.find_by(user_id:current_user.id) 
			@profile=Profile.find_by(user_id:current_user.id)
			country = @profile.country.downcase
			city = @profile.city.downcase
			@articles=Article.where(city:city,country:country).paginate(:page => params[:page],:per_page =>10)
			else
				redirect_to new_profile_path 
			end	
		else
			@articles = Article.all.paginate(:page => params[:page],:per_page =>10)
		end	
	    @categories=Category.all
	end	
	def new
		@article = Article.new
	end	
	def show
		if user_signed_in?
			@article=Article.find(params[:id]) 
			@profile=Profile.find_by(user_id:current_user.id)
		else
			@article=Article.find(params[:id]) 
		end	
	end	
	def create
		@article = Article.new(article_params)
		@article.country= @article.country.downcase
		@article.city= @article.city.downcase
		if @article.save
			redirect_to homes_index_path
		else
			render 'new'
		end
	end
	def accept_approval
		agree = Agreement.find(params[:id])
		article = Article.find(agree.article_id)
		user = User.find(agree.user_id)
		aprroved = Approval.new
		aprroved.user_id = user.id
		aprroved.article_id = article.id
		if aprroved.save
			user.articles.delete(article.id)
			redirect_to invitation_articles_path ,notice:"Approval Successful"
		else
			redirect_to invitation_articles_path ,notice:"Approval unsuccessfull"
		
		end	
	end	
	def cancel_approval
		@appr = Approval.find(params[:id])
		user = User.find(@appr.user_id)
		art= Article.find(@appr.article_id)
		@appr.user_id=nil
		@appr.article_id=nil
		if @appr.destroy
			if current_user.id == art.owner_id
			    CancelApprovalMailer.cancel_approval(user,art).deliver
				redirect_to active_user_articles_path ,notice:"Successfully Remove Employee"
			else
				CancelApprovalMailer.employee_cancel(User.find(art.owner_id),art,user).deliver
				redirect_to active_article_articles_path ,notice:"Successfully Remove Article"
			end	
		else
			redirect_to active_user_articles_path ,notice:"unsuccessfull"
		end	
	end	
	def active_article
		@approvals = Approval.where(user_id:current_user.id)
		@approvals = @approvals.paginate(:page =>params[:page],:per_page =>10)
	end	
	def active_user
		@approvals=Approval.all
	end	
	def send_invitation
		@articles=Article.all
		@agreements = current_user.articles
	    @agreements=@agreements.paginate(:page =>params[:page],:per_page =>10)
	end	
	def invitation
		@articles=Article.all
		@agreements = current_user.articles
	end	
	def agreement
		@article = Article.find(params[:id])
		@agreement = Agreement.new
		@agreement.user_id = current_user.id
		@agreement.article_id = @article.id
		if @agreement.save
			redirect_to articles_path ,notice: "You Applied Successfully"
		else
			redirect_to articles_path ,notice: "Discard "
		end	
	end	
	def cancel_agreement
		@article = Article.find(params[:id])
		if current_user.articles.delete(@article.id)
			
			redirect_to send_invitation_articles_path ,notice:"You have successfully cancel you invitation"
		else
			redirect_to send_invitation_articles_path ,notice:"Destroy"	
		end	
	end	
	def reject_agreement
		agr= Agreement.find(params[:id])
		@article = Article.find(agr.article_id)
		user = User.find(agr.user_id)
		if user.articles.delete(agr.article_id)
			agr.destroy
			RejectMailer.reject_user(user,@article).deliver
			redirect_to invitation_articles_path ,notice:"You have successfully cancel you invitation"
		else
			redirect_to invitation_articles_path ,notice:"Destroy"	
		end	
	end	
	def delete_article
		@article = Article.find(params[:id])
		@article.category_id=nil
		@article.owner_id=nil
		@article.cancel_agreement @article
		if @article.destroy
			redirect_to homes_index_path ,notice:"Succesfully Deleted"
		else
			redirect_to homes_index_path ,notice:"Not Deleted"
		end	
	end	
	def invitation_user
		@user= User.find(params[:id])
  		@profile = Profile.find_by(user_id:@user.id)
	end	
  private

    def article_params
      params.require(:article).permit(:category_id,:title, :description, :recruiting, :skills, :employability, :country, :city, :street,:owner_id)
    end
end

