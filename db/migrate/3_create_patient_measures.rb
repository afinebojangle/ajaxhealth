Sequel.migration do
    change do
        create_table(:patient_measures) do
            primary_key :id
            
            Date :due
            Date :completed_date
            Boolean :completed
            Float :value
            
            DateTime :created_at
            DateTime :updated_at
        end
        
        create_table(:patient_measure_types) do
            primary_key :id
            
            String :measure_type
            String :description
            
            DateTime :created_at
            DateTime :updated_at
        end
        
        create_table(:patient_measure_units) do 
            primary_key :id
            
            String :uom
            String :description
            
            DateTime :created_at
            DateTime :updated_at
        end
        
        alter_table(:patient_measures) do
            add_foreign_key :patient_id, :patients
            add_foreign_key :patient_measure_type_id, :patient_measure_types
            add_foreign_key :patient_measure_unit_id, :patient_measure_units
        end
    end
end