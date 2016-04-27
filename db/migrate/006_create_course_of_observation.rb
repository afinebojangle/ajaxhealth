Sequel.migration do
  up do
    create_table(:courses) do
      primary_key :id
      foreign_key :patient_id, :patients
      
      String :description
      Date :start_date
      Date :end_date
      Boolean :completed
      
      DateTime :created_at
      DateTime :updated_at
    end
    
    create_table(:observations) do
      primary_key :id
      foreign_key :course_id, :courses
      
      String :description
      String :frequency
      
      DateTime :created_at
      DateTime :updated_at
    end
    
    create_table(:scheduled_measures) do
      primary_key :id
      foreign_key :observation_id, :observations
      foreign_key :patient_measure_type_id, :patient_measure_types
      
      DateTime :created_at
      DateTime :updated_at
    end
  end
  
  down do
    drop_table(:courses, :observations, :scheduled_measures)
  end
end
      
    
        
        
        
      