#create an admin
admin = Patient.new(
    email:    'admin@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld'
    )

admin.skip_confirmation!
admin.save