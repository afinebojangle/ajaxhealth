class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :password_confirmation, :current_password, :member_id, :group_id, :effective_date, :first_name, :last_name, :ssn, :phone, :addr1, :addr2, :city, :state, :zip, :dob, :gender, :race)
    end
  end
end
