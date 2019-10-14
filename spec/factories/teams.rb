FactoryBot.define do
  factory :team do
    name { 'my-team' }
    association :owner, factory: :user
  end
end
