FactoryBot.define do
  factory :comment do
    content { 'Comment' }
    association :idea
    association :reaction

    trait :invalid do
      content { nil }
    end
  end
end
