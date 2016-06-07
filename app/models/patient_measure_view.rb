class PatientMeasureView < Sequel::Model(:patient_measure_view)
  #This is a materialized view which pre-combines data for patient measures to
  #reduce joins and lower the read load on the DB. Might be a bit premature but wanted to play with Sequel
  
  def self.refresh
    DB.refresh_view(:patient_measure_view)
  end
  
end