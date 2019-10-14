class Web::TeamsController < ApplicationController
  def index
    @teams = current_user.teams
  end

  def show
    @team = current_user.find_team(params[:id])

    redirect_to team_channel_path(@team, Team::Channel::DEFAULT)
  end
end
