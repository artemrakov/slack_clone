FactoryBot.define do
  factory :team do
    name { 'Happy team' }
    association :owner, factory: :user
  end
end
