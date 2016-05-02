class Provider::PatientsController < ApplicationController
  layout "provider"
  
  before_action :authenticate_provider!
  
  def index
    @patients = Patient.all
  end
  
  def show
    @patient = Patient[params[:id]]
    @courses = Course.where(patient_id: @patient.id).all
  end
end
