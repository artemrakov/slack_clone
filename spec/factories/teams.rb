FactoryBot.define do
  factory :team do
    name { 'my-team' }
    description { 'description' }
    association :owner, factory: :user
  end
end
