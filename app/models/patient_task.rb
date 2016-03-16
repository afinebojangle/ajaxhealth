class PatientTask < Sequel::Model
    plugin :timestamps, :update_on_create => true
    
    many_to_one :patients
    
    def mark_complete
        self.completed = true
        self.completed_date = DateTime.now
        self.save
    end
end