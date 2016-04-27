class Course < Sequel::Model
  plugin :timestamps, :update_on_create => true

  many_to_one :patients
  one_to_many :observations
  
end