FactoryBot.define do
  factory :team_invitation do
    association :user
    association :team
  end
end
