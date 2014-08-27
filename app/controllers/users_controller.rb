class UsersController < ApplicationController
	def index
		@search = User.search(params[:q])
		@users = @search.result.page(params[:page]).per(3)
		if current_user.admin_flag != 1
			redirect_to user_videos_path(current_user.id)
		end
	end
end
