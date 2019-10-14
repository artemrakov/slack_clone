class Web::TeamsController < ApplicationController
  def index
    @teams = current_user.teams
  end

  def show
    @team = current_user.find_team(params[:id])
    @channels = @team.channels
  end
end
