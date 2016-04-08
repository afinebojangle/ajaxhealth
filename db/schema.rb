Sequel.migration do
  change do
    create_table(:patient_measure_types) do
      primary_key :id
      column :measure_type, "text"
      column :description, "text"
      column :created_at, "timestamp without time zone"
      column :updated_at, "timestamp without time zone"
    end
    
    create_table(:patient_measure_units) do
      primary_key :id
      column :uom, "text"
      column :description, "text"
      column :created_at, "timestamp without time zone"
      column :updated_at, "timestamp without time zone"
    end
    
    create_table(:patients) do
      primary_key :id
      column :email, "text", :default=>"", :null=>false
      column :encrypted_password, "text", :default=>"", :null=>false
      column :reset_password_token, "text"
      column :reset_password_sent_at, "text"
      column :remember_created_at, "timestamp without time zone"
      column :sign_in_count, "integer", :default=>0, :null=>false
      column :current_sign_in_at, "timestamp without time zone"
      column :last_sign_in_at, "timestamp without time zone"
      column :current_sign_in_ip, "text"
      column :last_sign_in_ip, "text"
      column :confirmation_token, "text"
      column :confirmed_at, "timestamp without time zone"
      column :confirmation_sent_at, "timestamp without time zone"
      column :unconfirmed_email, "text"
      column :failed_attempts, "integer", :default=>0, :null=>false
      column :unlock_token, "text"
      column :locked_at, "timestamp without time zone"
      column :first_name, "text"
      column :last_name, "text"
      column :phone, "text"
      column :ssn, "text"
      column :addr1, "text"
      column :addr2, "text"
      column :city, "text"
      column :state, "text"
      column :zip, "integer"
      column :member_id, "text"
      column :group_id, "text"
      column :effective_date, "date"
      column :dob, "date"
      column :gender, "text"
      column :race, "text"
      column :created_at, "timestamp without time zone"
      column :updated_at, "timestamp without time zone"
      
      index [:confirmation_token], :unique=>true
      index [:email], :unique=>true
      index [:reset_password_token], :unique=>true
      index [:unlock_token], :unique=>true
    end
    
    create_table(:schema_info) do
      column :version, "integer", :default=>0, :null=>false
    end
    
    create_table(:patient_measures) do
      primary_key :id
      column :completed_date, "date"
      column :value, "double precision"
      column :created_at, "timestamp without time zone"
      column :updated_at, "timestamp without time zone"
      foreign_key :patient_id, :patients, :key=>[:id]
      foreign_key :patient_measure_type_id, :patient_measure_types, :key=>[:id]
      foreign_key :patient_measure_unit_id, :patient_measure_units, :key=>[:id]
    end
    
    create_table(:patient_tasks) do
      primary_key :id
      column :description, "text"
      column :due, "date"
      column :location, "text"
      column :completed, "boolean", :default=>false
      column :completed_date, "timestamp without time zone"
      foreign_key :patient_id, :patients, :key=>[:id]
      column :created_at, "timestamp without time zone"
      column :updated_at, "timestamp without time zone"
    end
  end
end
Sequel.migration do
  change do
    self << "SET search_path TO \"$user\", public"
    self << "INSERT INTO \"schema_info\" (\"version\") VALUES (4)"
  end
end
