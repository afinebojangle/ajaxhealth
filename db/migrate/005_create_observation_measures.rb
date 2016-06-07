Sequel.migration do
  up do
    create_table(:observation_measures) do
      primary_key :id
      foreign_key :observation_id, :observations
      foreign_key :patient_measure_id, :patient_measures
    end
  end
  
  down do
    drop_table(:observation_measures)
  end
end