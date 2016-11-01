Sequel.migration do
  up do
    create_table(:provider_alerts) do
      primary_key :id
      
      String :description
      Boolean :requires_action, :default => false
      Boolean :completed, :default => false
      
      foreign_key :provider_id, :providers
      foreign_key :patient_id, :patients
      foreign_key :course_id, :courses
      foreign_key :observation_id, :observations
      foreign_key :patient_measure_id, :patient_measures
      
      DateTime :created_at
      DateTime :updated_at
    end
  end
  
  
  down do
    drop_table(:provider_alerts)
  end
  
  
  
end