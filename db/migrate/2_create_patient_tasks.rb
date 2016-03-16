Sequel.migration do
  change do
    create_table(:patient_tasks) do
        primary_key :id
        
        String :description
        Date :due
        String :location
        Boolean :completed, :default => false
        DateTime :completed_date
        
        foreign_key :patient_id, :patients
        
        DateTime :created_at
        DateTime :updated_at
    end
  end
end