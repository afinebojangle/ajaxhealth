class PatientMeasureView < Sequel::Model(:patient_measure_view)
  
  def self.refresh
    DB.refresh_view(:patient_measure_view)
  end
  
end