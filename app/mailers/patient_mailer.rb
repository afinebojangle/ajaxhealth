class PatientsMailer < ApplicationMailer
    default from: 'noreply@ajaxhealth.com'
    

    def patient_alerts_reminder(user, alerts)
        @user = user
        @alerts = alerts
        @url = patient_alerts_url
        mail(to: @user.email, subject: "You Have #{@alerts.count} Alerts Outstanding")
    end
        
    
    
end
