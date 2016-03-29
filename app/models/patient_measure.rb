class PatientMeasure < Sequel::Model
   plugin :timestamps, :update_on_create => true
   
   one_to_one :patient_measure_type
   one_to_one :patient_measure_unit
   
   
    
end