class PatientConfirmationEmailer < ActiveJob::Base
  queue_as :default
  
  def perform(patient)
    patient.send_confirmation_instructions
  end
end