class Provider::PatientsController < ApplicationController
  layout "provider"
  
  before_action :authenticate_provider!
  
  def index
    @patients = Patient.all
  end
  
  def show
    @patient = Patient[params[:id]]
  end
end
