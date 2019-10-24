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
  content = Faker::Lorem.sentence(5)
  title = "タイトル-#{n+1}"
  users.each { |user| user.posts.create!(content: content, title: title) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

Tag.create([
  { name: "プログラミング" },
  { name: "大学受験" },
  { name: "資格勉強" },
  { name: "外国語習得" },
  { name: "読書" },
  { name: "趣味" }
])