Sequel.migration do
  up do
    
    DB = PatientMeasure.db
    
    view_definition = DB[:patient_measures].
      select{[
        Sequel.as(:patient_measures__completed_date, :date),
        Sequel.as(:patient_measure_types__measure_type, :measure),
        Sequel.as(:patient_measure_types__description, :description),
        Sequel.as(:patient_measures__value, :value),
        Sequel.as(:patient_measure_units__uom, :uom),
        Sequel.as(:patients__dob, :dob),
        Sequel.as(:patients__gender, :gender),
        Sequel.as(:patients__race, :race)
        ]}.
      join(:patient_measure_types, :id => :patient_measure_type_id).
      join(:patient_measure_units, :id => :patient_measures__patient_measure_unit_id).
      join(:patients, :id => :patient_measures__patient_id).
      sql
      
      create_view(:patient_measure_view, view_definition, :materialized => true)
  end
  
  down do
    drop_view(:patient_measure_view, :materialized => true)
  end
end