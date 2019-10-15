class Web::Teams::ApplicationController < ApplicationController
  before_action :authenticate_user!
  helper_method :resource_team

  def resource_team
    @resource_team ||= Team.friendly.find(params[:team_id])
  end
end
