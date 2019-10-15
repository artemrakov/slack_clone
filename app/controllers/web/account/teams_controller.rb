class Web::Account::TeamsController < ApplicationController
  def index
    @teams = current_user.all_teams
  end

  def new
    @team = Team.new
  end

  def create
    @team = current_user.owned_teams.build(team_params)

    if @team.save
      @team.invitations.create!(user: current_user)

      redirect_to account_teams_path
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
