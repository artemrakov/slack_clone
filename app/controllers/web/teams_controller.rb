class Web::TeamsController < ApplicationController
  def index
    @teams = Team.public_access
  end

  def show
    @team = current_user.find_team(params[:id])
    @channels = @team.channels
  end
end
