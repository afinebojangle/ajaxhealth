Sequel.migration do
  up do
    create_table(:courses) do
      primary_key :id
      foreign_key :patient_id, :patients
      
      String :description
      Date :start_date
      Date :end_date
      Boolean :completed, :default => false
      
      DateTime :created_at
      DateTime :updated_at
    end
    
    create_table(:observations) do
      primary_key :id
      foreign_key :course_id, :courses
      foreign_key :patient_measure_type_id, :patient_measure_types
      
      String :frequency
      Date :start_date
      Date :end_date
      
      DateTime :created_at
      DateTime :updated_at
    end
    
    alter_table(:patient_measures) do
      add_foreign_key :observation_id, :observations
    end
    
      
    

  end
  
  down do
    drop_table(:courses, :observations)
    
    drop_column :patient_measures, :observation_id
    

  end
end
      
    
        
        
        
      