require 'rails_helper'

RSpec.describe Web::HomeController, type: :controller do
  describe '#index' do
    it 'successful' do
      get :index
      expect(response).to have_http_status 200
    end
  end
end
