FactoryBot.define do
  factory :invitation do
    association :user
    association :team
  end
end
