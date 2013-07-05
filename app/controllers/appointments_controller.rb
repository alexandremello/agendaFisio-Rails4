class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :only_admin, except: :show
  before_action :verify_user, only: :show
  
  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
    #@patient = Patient.find(params[:patient_id])
    #@appointments = Appointment.find(params[:id])
  end

  # POST /appointments
  # POST /appointments.json
  def create
    #@patient = Patient.find(params[:patient_id])
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @appointment }
      else
        format.html { render action: 'new' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    #@patient = Patient.find(params[:patient_id])
    #@appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    #@patient = Patient.find(params[:patient_id])
    #@appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      #@patient = Patient.find(params[:patient_id])
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:start, :end, :description, :patient_id, :title)
    end

    # only admins!
    def only_admin
      if !current_user.admin?
        render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
      end
    end

  # Allow access only to admin user
  def verify_user
    if !current_user.admin?
      if current_user.patient != @patient
        render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
      end
    end
  end
end
