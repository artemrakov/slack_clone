require 'rails_helper'

RSpec.describe Web::Teams::ChannelsController, type: :controller do
  let(:user) { create(:user) }

  before(:each) do
    sign_in(user)
  end

  describe '#show' do
    it 'successful' do
      channel = create(:team_channel)

      get :show, params: { id: channel.slug, team_id: channel.team.slug }

      expect(response).to have_http_status 200
    end
  end

  describe '#new' do
    it 'successful' do
      team = create(:team)

      get :new, params: { team_id: team.slug }

      expect(response).to have_http_status 200
    end
  end

  describe '#create' do
    it 'creates the channel' do
      team = create(:team)
      attrs = attributes_for(:team_channel, team: team)

      post :create, params: { team_id: team.id, team_channel: attrs }
      channel = Team::Channel.find_by(team_id: team.id, name: attrs[:name])

      expect(response).to have_http_status 302
      expect(channel).to be_truthy
    end
  end
end
