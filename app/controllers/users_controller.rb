class UsersController < ApplicationController
	before_action :verify_user
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@user = User.all
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email)
	end

	def verify_user
		if !user_signed_in?
			redirect_to :new_user_session
		elsif !current_user.admin?
			render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
		end
	end
			
end