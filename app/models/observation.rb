class Observation < Sequel::Model
  plugin :timestamps, :update_on_create => true

  many_to_one :courses
  one_to_many :scheduled_measures
  
  def created_on
    self.created_at.to_date.strftime("%m/%d/%Y")
  end
  
  def type
    PatientMeasureType.where(id: self.patient_measure_type_id).map(:measure_type)
  end
  
end