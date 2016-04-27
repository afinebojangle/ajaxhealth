#create an admin patient

admin = Patient.new(
    email:    'adminpat@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld',
    first_name: 'Patient',
    last_name: 'McGee'
    )

admin.skip_confirmation!
admin.save

#create an admin provider

admin = Patient.new(
    email:    'adminpro@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld',
    first_name: 'Provider',
    last_name: 'McGee'
    )

admin.skip_confirmation!
admin.save

#create some rando patients

15.times do

    pword = Faker::Internet.password(8)
    
    patient = Patient.new(
        email:                 Faker::Internet.email,
        password:              pword,
        password_confirmation: pword,
        first_name:            Faker::Name.first_name,
        last_name:             Faker::Name.last_name,
        phone:                 Faker::PhoneNumber.phone_number,
        ssn:                   rand(100000000..999999999),
        addr1:                 Faker::Address.street_address,
        city:                  Faker::Address.city,
        state:                 Faker::Address.state,
        zip:                   rand(10000..99999),
        member_id:             rand(100000..999999),
        group_id:              rand(1000..9999),
        effective_date:        Faker::Date.backward(200),
        dob:                   Faker::Date.between(70.years.ago, Date.today),
        gender:                ["Male", "Female"].sample,
        race:                  ["White", "Black", "Hispanic", "Asian", "Native American", "Pacific Islander"].sample)
        
    patient.skip_confirmation!
    patient.save

end

#create some basic measure units

measure_units = {
    "/Minute" => "Occurances per minute",
    "/Hour" => "Occurances per hour",
    "/Second" => "Occurances per second",
    "/Day" => "Occurances per day",
    "/Month" => "Occurances per month",
    "/Year" => "Occurances per year",
    "/Mg" => "Amount per milligram",
    "/Ml" => "Amount per milliliter",
    "/Kg" => "Amount per Kilogram",
    "/Gm" => "Amount per Gram",
    "Minutes" => "Minutes to complete measure",
    "Hours" => "Hours to complete measure",
    "Seconds" => "Seconds to complete measure",
    "Days" => "Days to complete measure",
    "Meters" => "How many meters"
                }
                
measure_units.each do |key, value|
  m = PatientMeasureUnit.new(
      uom:         key,
      description: value)
  
  m.save
end

#create some basic measure types

measure_types = {
    "Max Effort Mile" => "Find a well measured mile track and give it your best. Record the time it took you to complete 1 mile at the fastest pace you can safely muster",
    "Push-ups in a minute" => "Have someone watch you and count how many strict push-ups you can do in one minute. Spotter is responsible for makings sure your form is good. These are strict push-ups from the toes.",
    "Knee Push-ups in a minute" => "Have someone watch you and count how many knee push-ups you can do in one minute. Spotter is responsible for makings sure your form is good. These are from the knees so we can compare when strict push-ups are not feasable.",
    "Weight" => "How much you weigh in kg",
    "Height" => "How tall you are in meters",
                }
                
measure_types.each do |key, value|
    t = PatientMeasureType.new(
        measure_type:     key,
        description:      value)
    
    t.save
end

#seed mile measures

patients = Patient.exclude(:id => 1).map(:id)
uom = PatientMeasureUnit.where(:uom => "Minutes").map(:id)[0]
type = PatientMeasureType.where(:measure_type => "Max Effort Mile").map(:id)[0]


patients.each do |p|
    date = Faker::Date.between(1.day.ago, 3.months.ago)
  
    8.times do  
      m = PatientMeasure.new(
          completed_date:           date,
          completed:                true,
          value:                    rand(4..60),
          patient_id:               p,
          patient_measure_type_id:  type,
          patient_measure_unit_id:  uom
          )
      m.save
      date = date - 3.months
    end
end



