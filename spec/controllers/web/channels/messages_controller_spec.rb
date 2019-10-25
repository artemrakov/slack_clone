require 'rails_helper'

RSpec.describe Web::Channels::MessagesController, type: :controller do 
  let(:user) { create(:user) }
  let(:channel) { create(:team_channel) }

  before (:each) do
    sign_in(user)
  end

  describe '#create' do
    it 'creates a message' do
      attrs = attributes_for(:message)

      post :create, params: { channel_id: channel.id, channel_message: attrs }
      message = channel.messages.find_by(attrs)

      expect(response).to have_http_status 302
      expect(message).to be_truthy
    end
  end

  describe '#destroy' do 
    it 'delete a message' do 
      message = create(:message, channel: channel)

      delete :destroy, params: { channel_id: channel.id, id: message.id }

      expect(channel.messages).to_not include(message)
    end
  end
end
