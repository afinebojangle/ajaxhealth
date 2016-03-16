class Patient::PatientController < ApplicationController
    layout "patient"
    before_action :authenticate_patient!
    
    def account
        @patient = current_patient
    end
    
    def edit
        @patient = current_patient
    end
    
    def update
        @patient = current_patient

        if @patient.valid_password?(params[:patient][:current_password])
            
            @patient.set_fields(params[:patient], [:email, :password, :password_confirmation, :member_id, :group_id, :effective_date, :first_name, :last_name, :ssn, :phone, :addr1, :addr2, :city, :state, :zip, :dob, :gender, :race], :missing=>:skip)
            
            if @patient.save(:validate => false)
                @patient.update_account_info_alert
                flash[:notice] = "Account Updated."
                redirect_to patient_dashboard_path
            else
                flash[:error] = "Error Updating Account, please try again."
                render :edit
            end
        else
            flash[:error] = "Current Password is Invalid."
            render :edit
        end
    end
    
    protected
    
    def patient_params
        params.require(:patient).permit(:email, :password, :password_confirmation, :current_password, :member_id, :group_id, :effective_date, :first_name, :last_name, :ssn, :phone, :addr1, :addr2, :city, :state, :zip, :dob, :gender, :race)
    end
    
end