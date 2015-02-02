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

10.times do |n|
  name = "course #{n + 1}"
  level = 5
  status = 1
  info = "it's good"
  Course.create!(name: name, total_level: level, info: info, status: status )
end

5.times do |n|
  name = "belong to course 1"
  level = 3
  status = 1
  info = "ruby"
  Subject.create!(name:name, total_level: level, info: info, status: status)
end

5.times do |n|
  course_id = 1
  subect_id = n + 1
  CourseSubject.create!(course_id: course_id, subject_id: subect_id)
end