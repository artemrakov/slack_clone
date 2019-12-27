class Web::Account::TeamsController < Web::Account::ApplicationController
  def index
    @teams = current_user.all_teams
  end

  def new
    @team = Team.new
  end

  def create
    @team = TeamMutator.create(team_params, current_user)

    if @team.persisted?
      redirect_to account_teams_path, notice: "Team is created"
    else
      render :new, notice: "Something went wrong"
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :description)
  end
end
