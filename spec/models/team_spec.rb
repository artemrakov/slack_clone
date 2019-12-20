require 'rails_helper'

RSpec.describe Team, type: :model do
  describe '#guest?' do
    it 'checks if user is not on the team' do
      team = create(:team)
      user = create(:user)

      expect(team.guest?(user)).to eq true
    end

    it 'check if user is on the team' do
      user = create(:user)
      team = create(:team)
      team.users << user

      expect(team.guest?(user)).to eq false
    end


  end
end
