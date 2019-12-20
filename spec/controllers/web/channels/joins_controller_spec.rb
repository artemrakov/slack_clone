require 'rails_helper'

RSpec.describe Web::Channels::JoinsController do
  let(:user) { create(:user) }

  before(:each) do
    sign_in(user)
  end

  it 'user joins the channel' do
    channel = create(:team_channel)
    post :create, params: { channel_id: channel }

    expect(channel.users).to include user
  end
end

