FactoryBot.define do
  factory :user do
    name "テストユーザー"
    email "test@example.com"
    password_digest "password"
    admin false
  end
end
