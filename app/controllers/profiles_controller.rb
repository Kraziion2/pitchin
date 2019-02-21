class ProfilesController < InheritedResources::Base
	before_action :authenticate_user!
	def new
		if user_signed_in?
			unless Profile.find_by(user_id:current_user.id).nil?
				redirect_to homes_index_path
			else
				@profile =Profile.new
			end	
		end	
	end	
	def create
		@profile = Profile.new(profile_params)
		if @profile.save
			redirect_to homes_index_path
		else
			render 'new'
		end	
	end	
  private

    def profile_params
      params.require(:profile).permit(:name, :surname, :education, :experience, :knowledge, :availability, :address, :user_id)
    end
end

