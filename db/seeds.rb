User.create!(name:  "管理ユーザー",
             email: "admin@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

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

Clock.create!(name:"5分")
Clock.create!(name:"10分")
Clock.create!(name:"15分")
Clock.create!(name:"20分")
Clock.create!(name:"25分")
Clock.create!(name:"30分")
Clock.create!(name:"35分")
Clock.create!(name:"40分")
Clock.create!(name:"45分")
Clock.create!(name:"50分")
Clock.create!(name:"55分")

Tag.create!([
  { name: "プログラミング" },
  { name: "大学受験" },
  { name: "資格勉強" },
  { name: "外国語習得" },
  { name: "読書" },
  { name: "趣味" }
])