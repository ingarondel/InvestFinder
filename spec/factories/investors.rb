FactoryBot.define do
  sequence :investor_email do |n|
    "investor#{n}@example.com"
  end

  factory :investor do
    email { generate(:investor_email) }
    type { 'Investor' }
    name { 'name' }
    surname { 'surname' }
    password { "password123" }
    confirmed_at { Time.now }
  end
end