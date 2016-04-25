class Provider::PatientMeasuresController < ApplicationController
  layout "provider"
  
  def new
    @patient = Patient[params[:patient_id]]
    @measure = PatientMeasure.new(:patient_id => @patient.id)
    @types = PatientMeasureType.select(:measure_type, :id).all
    @units = PatientMeasureUnit.select(:uom, :id).all
  end
  
  def create
    @patient = Patient[params[:patient_id]]
    @measure = PatientMeasure.new(patient_measure_params)
    if @measure.save
      flash[:notice] = 'Measure Created.'
      redirect_to provider_patient_path(@patient)
    else
      flash[:error] = 'Error Saving Measure. Please Try Again'
      render :new
    end
  end
  
  
  private
  
  def patient_measure_params
    params[:patient_measure][:completed_date] = Date.strptime(params[:patient_measure][:completed_date], "%m/%d/%Y")
    params[:patient_measure][:patient_id] = params[:patient_id]
    params.require(:patient_measure).permit(:completed_date, :completed, :patient_id, :value, :patient_measure_type_id, :patient_measure_unit_id)
  end



end