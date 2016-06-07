class PatientMeasureUnit < Sequel::Model
    #part of the EAV for patient measures, stores data about the unit of measure for patient measures.
    plugin :timestamps, :update_on_create => true
    
    one_to_many :patient_measures
    
    def validate
      super
      validates_presence [:uom, :description]
    end

end
