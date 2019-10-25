FactoryBot.define do
  factory :message, class: Team::Channel::Message do
    content { 'some content' }
    association :channel
    association :team
  end
end
