FactoryBot.define do
  factory :reaction do
    reaction_type { :like }
    association :reactable, factory: :idea
    association :user

    trait :invalid do
      reaction_type { nil }
    end
  end
end
