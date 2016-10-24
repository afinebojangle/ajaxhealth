class Patient::MeasuresController < ApplicationController
  layout "patient"
  before_action :authenticate_patient!
  
  def index
    ## started to add comparatives to graph but realized that was premature. Going foward just add data series
    ## to @data using the pattern below to add comparatives
    @measure_types = PatientMeasureView.where(id: current_patient.id).map(:type)
    unless params[:form].nil?
      @data = []
      @type = params[:form][:type]
      @data << { name: "You", data: PatientMeasureView.where(id: current_patient.id, type: @type).select_map([:date, :value]) }
    end
  end
  
end