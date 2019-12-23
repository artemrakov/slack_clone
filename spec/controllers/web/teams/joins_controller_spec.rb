require 'rails_helper'

RSpec.describe Web::Teams::JoinsController do
  let(:user) { create(:user) }

  before(:each) do
    sign_in(user)
  end

  it 'user joins the team and joins default channel' do
    team = create(:team)
    channel = create(:team_channel, :default_channel, team: team)
    post :create, params: { team_id: team }

    expect(team.users).to include user
  end
end
