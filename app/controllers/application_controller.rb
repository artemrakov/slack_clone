class ApplicationController < ActionController::Base
  include AuthManagment

  before_action :authenticate_user!
end
