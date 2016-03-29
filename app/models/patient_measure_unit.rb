class PatientMeasureUnit < Sequel::Model
    plugin :timestamps, :update_on_create => true
    
    one_to_many :patient_measures

end
