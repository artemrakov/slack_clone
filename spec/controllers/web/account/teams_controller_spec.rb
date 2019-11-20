require 'rails_helper'

RSpec.describe Web::Account::TeamsController, type: :controller do
  let(:user) { create(:user) }

  before(:each) do
    sign_in(user)
  end

  describe '#index' do
    it 'successful' do
      get :index

      expect(response).to have_http_status 200
    end
  end

  describe '#new' do
    it 'successful' do
      get :new

      expect(response).to have_http_status 200
    end
  end

  describe '#create' do
    it 'creates a team' do
      attrs = attributes_for(:team)

      post :create, params: { team: attrs }
      team = Team.find_by(name: attrs[:name])

      expect(response).to have_http_status 302
      expect(team).to be_truthy
      expect(TeamInvitation.exists?(user: user, team: team)).to be_truthy
      expect(Team::Channel.exists?(team: team, name: Team::Channel::DEFAULT)).to be_truthy
    end
  end
end
