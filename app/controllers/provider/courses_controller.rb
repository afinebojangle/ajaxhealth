class Provider::CoursesController < ApplicationController
  layout "provider"
  
  before_action :authenticate_provider!
  
  def show
    @course = Course[params[:id]]
    @patient = Patient[@course.patient_id]
    @observations = Observation.where(course_id: @course.id).all
    @observation = Observation.new
    @types = PatientMeasureType.select(:id, :measure_type).all
  end
  
  def new
    @patient = Patient[params[:patient_id]]
    @course = Course.new(:patient_id => @patient.id)
  end
  
  def create
    @patient = Patient[params[:patient_id]]
    @course = Course.new(patient_course_params)
    if @course.save
      flash[:notice] = 'Course Created.'
      redirect_to provider_patient_course_path(@patient, @course)
    else
      flash[:error] = 'Problem Saving Course. Please Try Again.'
      render :new
    end
  end
  
  
  private
  
  def patient_course_params
    params[:course][:start_date] = Date.strptime(params[:course][:start_date], "%m/%d/%Y")
    params[:course][:end_date] = Date.strptime(params[:course][:end_date], "%m/%d/%Y")
    params[:course][:patient_id] = params[:patient_id]
    params.require(:course).permit(:patient_id, :start_date, :end_date, :description)
  
  end
  
  
end