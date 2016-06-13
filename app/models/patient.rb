class Patient < Sequel::Model
  #Patient model
  plugin :devise
  plugin :timestamps, :update_on_create => true
  plugin :validation_helpers
  
  include Rails.application.routes.url_helpers
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
         
  one_to_many :patient_tasks
  one_to_many :patient_measures
  

  
  
 

  
  def age
    Date.today.year - self.dob.year
  end
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
end
