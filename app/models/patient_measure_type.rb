class PatientMeasureType < Sequel::Model
    #part of the patient measure EAV, stores data about measure types.
    plugin :timestamps, :update_on_create => true
    
    one_to_many :patient_measures
    one_to_many :observations
    
    def validate
      super
      validates_presence [:measure_type, :description]
    end
    
end
