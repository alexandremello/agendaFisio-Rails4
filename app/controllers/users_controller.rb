class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :verify_user, except: :show

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])

		respond_to do |format|
			format.html
			format.json { render json: @user }
		end
	end

	def new
		@patient = Patient.find(params[:patient_id])
		@user = User.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @user }
		end
	end

	def edit
		@patient = Patient.find(params[:patient_id])
		@user = User.find(params[:id])
	end

	def create
		@patient = Patient.find(params[:patient_id])
		@user = @patient.create_user(user_params)
		
		respond_to do |format|
			if @user.save
				format.html { redirect_to patient_path(@patient), notice: 'User was successful created.'}
				format.json { render json: @user, status: :created, location: @user }
			else
				format.html { render action: 'new' }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@patient = Patient.find(params[:patient_id])
		@user = User.find(params[:id])
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
		params.require(:user).permit([:email, :password])
	end

	def verify_user
		if current_user != @user && !current_user.admin? 
			render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
		end
	end
end