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
    if @observation.save
      flash[:notice] = "Observation Added."
      redirect_to provider_course_path(@course.id)
    else
      flash[:error] = "There Was a Problem Adding an Observation. Please Try Again."
      redirect_to provider_patient_course_path(@patient, @course)
    end
  end
  
  
  
  
  private
  
  def course_observation_params
    params[:observation][:course_id] = @course.id
    params.require(:observation).permit(:course_id, :patient_measure_type_id, :frequency)
  end
  
end