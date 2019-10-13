require 'rails_helper'

RSpec.describe Web::TeamsController, type: :controller do
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

  describe '#show' do
    it 'successful' do
      team = create(:team)

      get :show, params: { id: team.id }

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
      attrs = attributes_for(:team, owner_id: user.id)

      post :create, params: { team: attrs }

      expect(Team.find_by(name: attrs[:name])).to be_present
    end
  end
end
