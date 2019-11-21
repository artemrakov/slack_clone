class Web::Channels::JoinsController < Web::Channels::ApplicationController
  def create
    resource_channel.channel_invitations.create!(user: current_user)
    redirect_to team_channel_path(team_id: resource_channel.team_id, id: resource_channel)
  end
end
