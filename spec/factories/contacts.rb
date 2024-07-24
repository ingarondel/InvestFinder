FactoryBot.define do
  factory :contact do
    phone   { '+485512345' }
    email   { 'inga@gmail.com' }
    website { 'www.ww.com' }
    association :investor
  end
end
