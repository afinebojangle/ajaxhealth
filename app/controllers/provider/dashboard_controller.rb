class Provider::DashboardController < ApplicationController
    layout "provider"
    
    before_action :authenticate_user!
    
    
end
