FactoryBot.define do
  factory :team do
    sequence(:name) { |n| "team#{n}" }
    description { 'description' }
    association :owner, factory: :user
  end
end

