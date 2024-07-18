FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end
  factory :user do
    email
    name{'name'}
    surname{'surname'}
    password { "password123" }
    confirmed_at { Time.now }
  end
end
