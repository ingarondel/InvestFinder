FactoryBot.define do
  factory :response do
    association :investor
    association :idea
  end
end
