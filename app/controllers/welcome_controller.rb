class WelcomeController < ApplicationController
  
  layout :welcome_layout
  
  
  before_action :route_user, only: :home
  

  def home
  end
  
  
  private
  
  def route_user
    if current_patient
      redirect_to patient_dashboard_path
    elsif current_provider
      redirect_to provider_dashboard_path
    end
  end
  
  def welcome_layout
    if current_patient
      "patient"
    else
      "application"
    end
  end
  
end
