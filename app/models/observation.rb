class Observation < Sequel::Model
  plugin :timestamps, :update_on_create => true
  plugin :validation_helpers

  many_to_one :courses
  
  def validate
    super
    validates_presence [:course_id, :frequency, :patient_measure_type_id, :start_date, :end_date]
    errors.add(:frequency, 'not a valid frequency') unless frequency.in?(Observation.allowed_frequencies)
  end
  
  def created_on
    self.created_at.to_date.strftime("%m/%d/%Y")
  end
  
  def type
    PatientMeasureType.where(id: self.patient_measure_type_id).map(:measure_type)[0]
  end
  
  def self.allowed_frequencies
    ['Weekly', 'Monthly', 'Daily', 'Yearly', 'Once', 'Bi-Weekly', 'Bi-Monthly']
  end
  
  def to_intervals
    #Case statement turns allowed frequencies into seconds so we can caluclate how many occurances should happen for a given observation/frequency pair.
    #might not be necessary to go down to the second level but I figure that will work for all possible frequencies and computers are good at maths.
    #formula turns the difference between the start_date and end_date into seconds and then divides by the number of seconds in the frequency period and rounds down. We always want at least one measure.
    
    case
      when frequency = 'Weekly' then [((self.end_date - self.start_date).to_i*24*60*60 / (7*24*60*60).to_f).floor, 1].max
      when frequency = 'Monthly' then [((self.end_date - self.start_date).to_i*24*60*60 / (30*24*60*60).to_f).floor, 1].max
      when frequency = 'Daily' then [((self.end_date - self.start_date).to_i*24*60*60 / (24*60*60).to_f).floor, 1].max
      when frequency = 'Yearly' then [((self.end_date - self.start_date).to_i*24*60*60 / (365*24*60*60).to_f).floor, 1].max
      when frequency = 'Once' then 1
      when frequency = 'Bi-Weekly' then [((self.end_date - self.start_date).to_i*24*60*60 / (14*24*60*60).to_f).floor, 1].max
      when frequency = 'Bi-Monthly' then [((self.end_date - self.start_date).to_i*24*60*60 / (60*24*60*60).to_f).floor, 1].max
      else raise "No Frequency Match"
    end
  end
  
  def measure_count
    PatientMeasure.where(patient_measure_type_id: self.patient_measure_type_id, completed_date: self.start_date..self.end_date, patient_id: Course[self.course_id].patient_id).count
  end
    
  
  
  
end