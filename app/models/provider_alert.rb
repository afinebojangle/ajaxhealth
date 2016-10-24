class ProviderAlert < Sequel::Model
  #stores provider alerts. Used to alert providers to pending tasks for general info and meaningful events.
  
  plugin :timestamps, :update_on_create => true
  plugin :validation_helpers
  
end