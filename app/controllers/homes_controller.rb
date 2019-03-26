class HomesController < InheritedResources::Base

	def index
		@articles=Article.all
	end	
  private

    def home_params
      params.require(:home).permit()
    end
end

