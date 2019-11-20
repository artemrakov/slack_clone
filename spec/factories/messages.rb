FactoryBot.define do
  factory :message, class: Team::Channel::Message do
    content { 'some content' }
    association :channel, factory: :team_channel
    association :team
    association :user
  end
end
