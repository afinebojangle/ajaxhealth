class PatientAlert < Sequel::Model
  #stores patient alerts. Used to alert patients to pending tasks for general info and meaningful events.
  
  plugin :timestamps, :update_on_create => true
  plugin :validation_helpers
  
end