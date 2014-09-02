class UsersController < ApplicationController
  before_action :set_user

	def index
		@search = User.search(params[:q])
		@users = @search.result(distinct: true).includes(:videos).page(params[:page]).per(3)
		if @user.admin_flag != 1
			redirect_to user_videos_path(@user.id)
		end
	end

  private
    def set_user
      @user = current_user
    end
end
