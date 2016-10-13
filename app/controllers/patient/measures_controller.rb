class Patient::MeasuresController < ApplicationController
  layout "patient"
  before_action :authenticate_patient!
  
  def index
    @measure_types = PatientMeasureView.where(id: current_patient.id).map(:type)
    if params[:type]
      @type = params[:type]
      @data = PatientMeasureView.where(id: current_patient.id, type: @type).select_map([:date, :value])
    end
  end
  
end