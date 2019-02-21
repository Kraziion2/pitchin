class ArticlesController < InheritedResources::Base
	def new
		@article = Article.new
	end	
	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to homes_index_path
		else
			render 'new'
		end
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
		@agree= Agreement.find(user_id:current_user.id,article_id:@article.id)
		if current_user.articles.delete(@article.id)
			@agree.destroy
			redirect_to homes_index_path ,notice:"You have successfully cancel you invitation"
		else
			redirect_to homes_index_path ,notice:"Destroy"	
		end	
	end	
	def reject_agreement
		agr= Agreement.find(params[:id])
		user = User.find(agr.user_id)
		if user.articles.delete(agr.article_id)
			agr.destroy
			redirect_to homes_index_path ,notice:"You have successfully cancel you invitation"
		else
			redirect_to homes_index_path ,notice:"Destroy"	
		end	
	end	
  private

    def article_params
      params.require(:article).permit(:title, :description, :recruiting, :skills, :employability, :country, :city, :street,:owner_id)
    end
end

