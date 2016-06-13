class Provider < Sequel::Model
  #provider model
  plugin :devise
  plugin :timestamps, :update_on_create => true
  plugin :validation_helpers
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
  
end
