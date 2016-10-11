class PatientMeasure < Sequel::Model
   #patient measures are the basis of our whole system. This model stores their data using an EAV architecture
   plugin :timestamps, :update_on_create => true
   plugin :validation_helpers
   
   one_to_one :patient_measure_type
   one_to_one :patient_measure_unit
   many_to_one :patients
   many_to_one :observations
   
   def validate
     super
     validates_presence [:value, :patient_id, :patient_measure_type_id, :patient_measure_unit_id]
   end
   

   
   
    
end