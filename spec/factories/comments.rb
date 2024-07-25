FactoryBot.define do
  factory :comment do
    content { 'Comment' }
    association :idea

    trait :invalid do
      content { nil }
    end
  end
end
