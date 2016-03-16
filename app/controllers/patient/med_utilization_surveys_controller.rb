class Patient::MedUtilizationSurveysController < ApplicationController
    layout "patient"
    before_action :authenticate_user!
    
    def index
    
    end
    
    def new
        @survey = MedUtilizationSurvey.new
    end
    
    def create
        @user_id = current_user.id
        @survey = MedUtilizationSurvey.new(med_utilization_survey_params)
        @survey.user_id = @user_id
        if @survey.save
            flash[:notice] = "Survey Saved."
            redirect_to patient_dashboard_path
        else
            flash[:notice] = "There was a problem saving your survey. Please try again."
            render :new
        end
    end
    
    
    
    private
    
    def med_utilization_survey_params
        params.require(:med_utilization_survey).permit(:health, :description, :visits, :visited, :prescribed, :prescriptions, :other)
    end
        
end
