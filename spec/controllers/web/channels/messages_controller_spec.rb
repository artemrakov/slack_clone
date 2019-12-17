require 'rails_helper'

RSpec.describe Web::Channels::MessagesController, type: :controller do 
  let(:user) { create(:user) }
  let(:channel) { create(:team_channel, :with_users) }

  before (:each) do
    sign_in(user)
  end

  describe '#create' do
    it 'creates a message' do
      attrs = attributes_for(:message)

      post :create, params: { channel_id: channel.id, team_channel_message: attrs }
      message = channel.messages.find_by(attrs)

      expect(response).to have_http_status 302
      expect(message).to be_truthy
      expect(Notification.find_by(resource_id: message.id)).to be_truthy
    end
  end

  describe '#update' do
    it 'updates a message' do
      message = create(:message)
      attrs = { content: 'new text' }

      patch :update, params: { channel_id: channel.id, id: message.id, team_channel_message: attrs }

      expect(response).to have_http_status 302
      expect(message.reload.content).to eq attrs[:content] 
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
