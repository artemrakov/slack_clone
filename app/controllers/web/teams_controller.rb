class Web::TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.friendly.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = current_user.owned_teams.build(team_params)

    if @team.save
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
