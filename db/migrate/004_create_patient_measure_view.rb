Sequel.migration do
  up do    
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
      
      view2 = DB.run "select a.id,
        a.completed_date,
        b.measure_type as type,
        b.description,
        a.value,
        c.uom,
        d.dob,
        d.gender,
        d.race
      from patient_measures as a
        inner join patient_measure_types as b on (a.patient_measure_type_id = b.id)
        inner join patient_measure_units as c on (a.patient_measure_unit_id = c.id)
        inner join patients d on (a.patient_id = d.id)"

      create_view(:patient_measure_view, view_definition, :materialized => true)
  end

  down do
    drop_view(:patient_measure_view, :materialized => true)
  end
end
