FactoryBot.define do
  factory :user do
    first_name { "Bob" }
    last_name { "Last" }
    sequence(:email) { |n| "tester#{n}@test.com" }
    password { "secret" }
    password_confirmation { "secret" }
  end
end
