FactoryBot.define do
  factory :team_channel, class: Team::Channel  do
    sequence(:name) { |n| "channel#{n}" }
    association :team

    trait :with_users do
      after :create do |channel|
        create(:channel_invitation, channel: channel)
        create(:channel_invitation, channel: channel)
      end
    end

  end
end
