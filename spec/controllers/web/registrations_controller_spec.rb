require 'rails_helper'

RSpec.describe Web::RegistrationsController, type: :controller do
  describe '#new' do
    it 'successful' do
      get :new
      expect(response).to have_http_status 200
    end
  end

  describe '#create' do
    it 'creates a user and sign the user in' do
      attrs = attributes_for(:user)

      post :create, params: { user: attrs }

      expect(response).to have_http_status 302
      expect(User.find_by(email: attrs[:email])).to exist
      expect(signed_in?).to eq true
    end
  end
end
