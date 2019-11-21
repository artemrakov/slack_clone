class Web::Teams::JoinsController < Web::Teams::ApplicationController
  def create
    resource_team.team_invitations.create!(user: current_user)
    resource_team.channels.find_by(name: Team::Channel::DEFAULT).channel_invitations.create(user: current_user)

    redirect_to team_channel_path(resource_team, Team::Channel::DEFAULT)
  end
end
