FactoryBot.define do
  factory :post do
    content "MyText"
    title "MyString"
    material "test-material"
    association :user
  end
end
