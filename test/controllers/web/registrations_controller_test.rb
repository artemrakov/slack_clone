require 'test_helper'

class Web::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test '#new' do
    get new_registration_url
    assert_response :success
  end
end
