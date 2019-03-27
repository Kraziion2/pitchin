class HomesController < InheritedResources::Base
	before_action :authenticate_user!
	def index
		@articles=Article.all
	end	

	def home
		if user_signed_in?
			if Profile.find_by(user_id:current_user.id)
			else
			redirect_to new_profile_path
			end	
		end

  	end
  private

    def home_params
      params.require(:home).permit()
    end
end

