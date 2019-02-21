class ArticlesController < InheritedResources::Base
	def new
		@article = Article.new
	end	
	def create
		@article = Article.new(article_params)
		if @article.save
			@agreement=Agreement.new
			@agreement.user_id = current_user.id
			@agreement.article_id = @article.id
			redirect_to homes_index_path
		else
			render 'new'
		end
	end

  private

    def article_params
      params.require(:article).permit(:title, :description, :recruiting, :skills, :employability, :country, :city, :street,:owner_id)
    end
end

