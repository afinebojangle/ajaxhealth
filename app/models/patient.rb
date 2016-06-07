class Patient < Sequel::Model
  #Patient model
  plugin :devise
  plugin :timestamps, :update_on_create => true
  
  include Rails.application.routes.url_helpers
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
         
  one_to_many :patient_tasks
  one_to_many :patient_measures
  
  after_create :create_patient_account_task
  
  after_update :update_account_info_alert
  
 

  
  def age
    Date.today.year - self.dob.year
  end
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  
  def create_patient_account_task
    PatientTask.create(description: "Fill out all your account information", due: Date.today + 1.week, location: patient_edit_url, patient_id: self.id)
  end
  
  
  def get_patient_alerts
    PatientTask.where(:patient_id => self.id, :completed => false).order(Sequel.desc(:due)).all
  end

  def check_patient_info
    if (self.first_name.blank? || self.last_name.blank? || self.phone.blank? || self.ssn.blank? || self.addr1.blank? || self.state.blank? || self.city.blank? || self.zip.blank? || self.member_id.blank? || self.group_id.blank? || self.effective_date.blank? || self.dob.blank? || self.gender.blank? || self.race.blank?)
      false
    else
      true
    end
  end
  
  def update_account_info_alert
    
    alerts = PatientTask.where(:patient_id => self.id, :description => "Fill out all your account information", :completed => false).all
    
    unless alerts.empty?
      if self.check_patient_info
        alerts.each do |a|
          a.mark_complete
        end
      end
    end
  end
  
end
