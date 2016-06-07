class Provider::ObservationsController < ApplicationController
  layout "provider"
  
  before_action :authenticate_provider!
  
  def new
    @course = Course[params[:course_id]]
    @patient = Patient[@course.patient_id]
    @observation = Observation.new(course_id: @course.id)
  end
  
  def create
    @course = Course[params[:course_id]]
    @observation = Observation.new(course_observation_params)
    if @observation.valid?
      @observation.save
      flash[:notice] = "Observation Added."
      redirect_to provider_course_path(@course.id)
    else
      flash[:validation] = @observation.errors.full_messages
      redirect_to provider_course_path(@course)
    end
  end
  
  
  
  
  private
  
  def course_observation_params
    unless (params[:observation][:start_date].blank? || params[:observation][:end_date].blank?)
      params[:observation][:start_date] = Date.strptime(params[:observation][:start_date], "%m/%d/%Y")
      params[:observation][:end_date] = Date.strptime(params[:observation][:end_date], "%m/%d/%Y")
    end
    params[:observation][:course_id] = @course.id
    params.require(:observation).permit(:course_id, :patient_measure_type_id, :frequency, :start_date, :end_date)
  end
  
end