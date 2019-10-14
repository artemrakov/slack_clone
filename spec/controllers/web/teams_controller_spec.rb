require 'rails_helper'

RSpec.describe Web::TeamsController, type: :controller do
  describe '#index' do
    it 'successful' do
      get :index

      expect(response).to have_http_status 200
    end
  end

  describe '#show' do
    it 'successful' do
      team = create(:team)
      channel = create(:team_channel, team: team, name: Team::Channel::DEFAULT)
      user = create(:user)
      invite = create(:invitation, user: user, team: team)


      sign_in(user)
      get :show, params: { id: team.id }

      expect(response).to have_http_status 302
    end
  end
end
