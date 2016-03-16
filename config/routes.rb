Rails.application.routes.draw do
    
    devise_for :patients
    
   
    namespace :provider do
        get '/' => 'dashboard#dashboard'
    end
  
    namespace :admin do
        get '/' => 'dashboard#dashboard'
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
