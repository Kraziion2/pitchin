class CategoriesController < InheritedResources::Base
	def show 
		@category = Category.find(params[:id])
		@profile=Profile.find_by(user_id:current_user.id)
		@articles = Article.where(category_id:@category.id,country:@profile.country,city:@profile.city)
		end	
  private

    def category_params
      params.require(:category).permit(:name)
    end
end

