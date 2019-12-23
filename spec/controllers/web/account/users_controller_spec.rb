require 'rails_helper'

RSpec.describe Web::Account::UsersController, type: :controller do 
  let(:user) { create(:user) }

  before(:each) do
    sign_in(user)
  end

  describe '#edit' do
    it 'successfull' do
      get :edit

      expect(response).to have_http_status 200
    end
  end

  describe '#update' do
    it 'should update attributes of the user' do
      avatar = fixture_file_upload('files/person.png')
      attrs = { user: { first_name: 'New name', last_name: 'New last', avatar: avatar } }

      expect {
       patch :update, params: attrs
      }.to change(ActiveStorage::Attachment, :count).by(1)
      user.reload

      expect(user.first_name).to eq attrs[:user][:first_name]
      expect(user.last_name).to eq attrs[:user][:last_name]
    end
  end
end
