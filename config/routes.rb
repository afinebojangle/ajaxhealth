Rails.application.routes.draw do
    
    devise_for :patients
    devise_for :providers
    
   
    namespace :provider do
        get '/dashboard' => 'dashboard#dashboard'
        resources :patients do
            resources :patient_measures
        end
        get '/account' => 'provider#account'
    end
  
  
    namespace :patient do
        get '/dashboard' => 'dashboard#dashboard'
        get '/alerts' => 'dashboard#alerts'
        get '/surveys' => 'dashboard#surveys'
        get '/account' => 'patient#account'
        get '/edit' =>  'patient#edit'
        put '/edit' => 'patient#update'
    end
  
  
  root to: 'welcome#home'
  
 
  
  get '/' => 'welcome#home'
  get '/problem' => 'welcome#problem'
  get '/solution' => 'welcome#solution'
  get '/notes' => 'welcome#notes'
  get '/router' => 'welcome#router'

end
