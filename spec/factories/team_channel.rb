FactoryBot.define do
  factory :team_channel, class: Team::Channel  do
    name { 'ruby' }
    association :team
  end
end
