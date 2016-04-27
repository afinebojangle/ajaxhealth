class Observation < Sequel::Model
  plugin :timestamps, :update_on_create => true

  many_to_one :courses
  one_to_many :scheduled_measures
  
end