FactoryBot.define do
  factory :channel_invitation do
    association :user
    association :channel, factory: :team_channel
  end
end
