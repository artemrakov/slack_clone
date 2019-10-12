require 'rails_helper'

RSpec.describe Web::SessionsController, type: :controller do
  describe '#new' do
    it 'successful' do
      get :new
      expect(response).to have_http_status 200
    end
  end

  describe '#create' do
    it 'logs in the user' do
      user = create(:user)

      post :create, params: { user: { email: user.email, password: user.password } }

      expect(signed_in?).to eq true
      expect(current_user.email).to eq user.email
    end
  end


  describe '#destroy' do
    it 'log outs the user' do
      user = create(:user)
      sign_in(user)

      delete :destroy, params: { id: user.id }

      expect(response).to have_http_status 302
      expect(signed_in?).to eq false
    end
  end
end
