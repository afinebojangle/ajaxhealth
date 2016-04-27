class ScheduledMeasure < Sequel::Model
  plugin :timestamps, :update_on_create => true

  many_to_one :observations
  many_to_one :patient_measure_types
  
end