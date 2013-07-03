class UsersController < ApplicationController
	before_action :verify_user
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
		@patient = Patient.find(params[:patient_id])
		@user = Patient.find(params[:id])

		respond_to do |format|
			format.html
			format.json { render json: @user }
		end
	end

	def new
		@user = User.new
	end

	def edit
	end

	def create
		@user = Patient.new(patient_params)
		
		respond_to do |format|
			if @user.save
				format.html { redirect_to @user, notice: 'User was successful created.'}
				format.json { render action 'show', status: :created, location: @user }
			else
				format.html { render action: 'new' }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to @user, notice: 'User was successful updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@user.destroy
		respond_to do |format| 
			format.html { redirect_to users_url }
			format.json { head :no_content }
		end
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