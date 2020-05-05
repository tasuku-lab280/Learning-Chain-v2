User.create!(name:  "管理ユーザー",
             email: "admin@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

User.create!(name:  "テストユーザー",
             email: "test@example.com",
             password:              "password",
             password_confirmation: "password")

60.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
35.times do |n|
  content = Faker::Food.description
  title = Faker::Food.dish
  users.each { |user| user.posts.create!(content: content, title: title) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
