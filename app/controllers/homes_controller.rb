class HomesController < InheritedResources::Base
	before_action :authenticate_user!
	def index
		@articles=Article.all
		@agreements = current_user.articles
	end	
  private

    def home_params
      params.require(:home).permit()
    end
end

