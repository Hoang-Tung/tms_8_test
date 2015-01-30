User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             role: "supervisor")

User.create!(name:  "Minh Teo",
             email: "minhld1709@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             role: "supervisor")
		

User.create!(name:  "alo ha",
             email: "aloha@gmail.com",
             password:              "123456",
             password_confirmation: "123456")
    

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end