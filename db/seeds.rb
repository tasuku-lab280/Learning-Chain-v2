User.create!(name:  "管理ユーザー",
             email: "admin@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

User.create!(name:  "テストユーザー",
             email: "test@example.com",
             password:              "password",
             password_confirmation: "password")

50.times do |n|
  name  = "会員#{n+1}"
  email = "example-#{n+1}@example.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).first(10)
35.times do |n|
  title = "サンプルタイトル#{n+1}"
  material = "サンプル教材#{n+1}"
  tag = Post.tag.values.sample
  content = "サンプル内容#{n+1}"
  users.each { |user| user.posts.create!(title: title, material: material, tag: tag, content: content) }
end

users = User.all
user  = users.second
following = users[3..20]
followers = users[4..30]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
