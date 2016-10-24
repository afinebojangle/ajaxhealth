Sequel.migration do
  up do
    create_table(:patient_alerts) do
      primary_key :id
      
      String :description
      Boolean :requires_action, :default => false
      Boolean :compelted, :default => false
      
      foreign_key :patient_id, :patients
      foreign_key :course_id, :courses
      foreign_key :observation_id, :observations
      foreign_key :patient_measure_id, :patient_measures
      
      DateTime :created_at
      DateTime :updated_at
    end
  end
  
  
  down do
    drop_table(:patient_alerts)
  end
  
  
  
end