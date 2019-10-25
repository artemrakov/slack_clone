FactoryBot.define do
  factory :message, class: Team::Channel::Message do
    content { 'some content' }
  end
end
