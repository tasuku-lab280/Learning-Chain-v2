FactoryBot.define do
  factory :user do
    name "テストユーザー"
    sequence(:email) { |n| "test#{n}@example.com" }
    password_digest "password"
    admin false
  end
end
