class Patient::DashboardController < ApplicationController
    layout "patient"
    before_action :authenticate_patient!
    
    def dashboard
    end
    
    def alerts
        @alerts = current_patient.get_patient_alerts
    end
    
    def surveys
        
    end
end
