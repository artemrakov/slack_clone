class Web::TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.friendly.find(params[:id])

    redirect_to team_channel_path(@team, Team::Channel::DEFAULT)
  end
end
