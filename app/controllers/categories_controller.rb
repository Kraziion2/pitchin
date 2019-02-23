class CategoriesController < InheritedResources::Base
	def show 
		@category = Category.find(params[:id])
		if user_signed_in?
			@profile=Profile.find_by(user_id:current_user.id)
			country = @profile.country.downcase
			city = @profile.city.downcase
			@articles = Article.where(category_id:@category.id,country:country,city:city)
	
		else
			@articles = Article.where(category_id:@category.id)
		end	
	end	
  private

    def category_params
      params.require(:category).permit(:name)
    end
end

