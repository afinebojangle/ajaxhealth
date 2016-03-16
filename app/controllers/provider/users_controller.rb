class Provider::UsersController < ApplicationController
    layout "provider"
    
    before_action :authenticate_user!
    
    def index
        @users = User.all.entries
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(provider_user_params)
            redirect_to provider_user_path(@user)
            flash[:notice] = "Patient Updated"
        else
            flash[:error] = "Error updating patient. Please try again."
            render :edit
        end
    end
    
    
    private
    
    def provider_user_params
        params.require(:user).permit(:email, :member_id, :group_id, :effective_date, :first_name, :last_name, :ssn, :phone, :addr1, :addr2, :city, :state, :zip, :dob, :gender, :race)
    end
end
