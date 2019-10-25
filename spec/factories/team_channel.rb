FactoryBot.define do
  factory :team_channel, class: Team::Channel  do
    sequence(:name) { |n| "channel#{n}" }
    association :team
  end
end
