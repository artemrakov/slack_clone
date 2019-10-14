class Web::TeamsController < ApplicationController
  def index
    @teams = current_user.teams
  end

  def show
    @team = current_user.teams.friendly.find(params[:id])
  end
end
