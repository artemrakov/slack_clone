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
      invite = create(:invitation, user: user, team: team)

      get :show, params: { id: team.id }

      expect(response).to have_http_status 200
    end
  end
end
