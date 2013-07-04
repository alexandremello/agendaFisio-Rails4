class ExamsController < ApplicationController
	#before_action :authenticate_user!
	before_action :only_admin
	#before_action :set_exam, only: [:show, :edit, :update, :destroy]
	
	# GET /exams
	# GET /exams.json
	def index
		@exams = Exam.all
	end

	# GET /exams/1
	# GET /exams/1.json
	def show
		@exam = Exam.find(params[:id])

		respond_to do |format|
			format.html
			format.json { render json: @user }
		end
	end

	# GET /exams/new
	def new
		@patient = Patient.find(params[:patient_id])
		@exam = Exam.new

		respond_to do |format|
			format.html
			format.json { render json: @user }
		end
	end

	# GET /exams/1/edit
	def edit
		@patient = Patient.find(params[:patient_id])
		@user = User.find(params[:id])
	end

	# POST /exams
	# POST /exams.json
	def create
		@patient = Patient.find(params[:patient_id])
		@exam = @patient.exams.new(exam_params)

		respond_to do |format|
			if @exam.save
				format.html { redirect_to patient_path(@patient), notice: 'Exam was successfully created.' }
				format.json { render action: 'show', status: :created, location: @exam }
			else
				format.html { render action: 'new' }
				format.json { render json: @exam.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /exams/1
	# PATCH/PUT /exams/1.json
	def update
		@patient = Patient.find(params[:patient_id])
		@exam = Exam.find(params[:id])

		respond_to do |format|
			if @exam.update(exam_params)
				format.html { redirect_to patient_exam_path(@patient, @exam), notice: 'Exam was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @exam.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /exams/1
	# DELETE /exams/1.json
	def destroy
		@patient = Patient.find(params[:patient_id])
		@exam = Exam.find(params[:id])
		@exam.destroy
		respond_to do |format|
			format.html { redirect_to patient_path(@patient) }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_exam
			@exam = Exam.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def exam_params
			params.require(:exam).permit(:date, :description)
		end

		# only admins!
		def only_admin
			if !current_user.admin?
				render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
			end
		end
end
