class Provider::PatientMeasuresController < ApplicationController
  layout "provider"
  
  before_action :authenticate_provider!
  
  def new
    @patient = Patient[params[:patient]]
    if params[:observation] then @observation = Observation[params[:observation]] end
    @measure = PatientMeasure.new()
    @types = PatientMeasureType.select(:measure_type, :id).all
    @units = PatientMeasureUnit.select(:uom, :id).all
  end
  
  def create
    @patient = Patient[params[:patient_measure][:patient_id]]
    @observation = Observation[params[:patient_measure][:observation_id]]
    @measure = PatientMeasure.new(patient_measure_params)
    if @measure.valid? 
      @measure.save
      flash[:notice] = 'Measure Created.'
      @observation == nil ? redirect_to(provider_patient_path(@patient.id)) : redirect_to(provider_course_path(@observation.course_id))
    else
      flash[:validation] = @measure.errors.full_messages
      render :new
    end
  end
  
  
  private
  
  def patient_measure_params
    unless params[:patient_measure][:date].blank? then params[:patient_measure][:date] = Date.strptime(params[:patient_measure][:date], "%m/%d/%Y") end
    if params[:patient] then params[:patient_measure][:patient_id] = params[:patient] end
    if params[:observation] then params[:patient_measure][:observation_id] = params[:observation] end
    params.require(:patient_measure).permit(:date, :patient_id, :value, :patient_measure_type_id, :patient_measure_unit_id, :observation_id, :measure_reason)
  end



end