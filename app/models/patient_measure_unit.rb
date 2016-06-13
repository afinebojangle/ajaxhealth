class PatientMeasureUnit < Sequel::Model
  #this model is part of the EAV model for patient measures
  
    plugin :timestamps, :update_on_create => true
    plugin :validation_helpers
    
    one_to_many :patient_measures
    
    def validate
      super
      validates_presence [:uom, :description]
    end

end
