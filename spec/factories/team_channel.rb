FactoryBot.define do
  factory 'team/channel' do
    name { 'ruby' }
    association :team
  end
end
