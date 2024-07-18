FactoryBot.define do
  factory :idea do
    title            { "MyString" }
    description      { "MyText" }
    fund_capital     { 100 }
    industries       { "Industry" }
    problem_solved   { "Solved" }
    geographic_focus { "Europe"}
    team_members     { "1 CTO" }
    next_steps       { "Next" }
    investor_require { "Requirement" }

    association :user

    trait :invalid do
      title { nil }
    end
  end
end
