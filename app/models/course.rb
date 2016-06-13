class Course < Sequel::Model
  #This model stores data about the course in course of observations
  plugin :timestamps, :update_on_create => true
  plugin :validation_helpers

  many_to_one :patients
  one_to_many :observations
  
  def validate
    super
    validates_presence [:patient_id, :description, :start_date, :end_date]
  end
  
end