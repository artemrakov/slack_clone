require 'test_helper'

class Web::SessionsControllerTest < ActionDispatch::IntegrationTest
  test '#new' do
    get new_session_path
    assert_response :success
  end
end
