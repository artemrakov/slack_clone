class Web::Teams::ChannelsController < Web::Teams::ApplicationController
  def show
    @channels = current_user.channels.where(team: resource_team)
    @channel = resource_team.find_channel(params[:id])
    @messages = @channel.messages
    @message = Team::Channel::Message.new
  end

  def new
    @channel = Team::Channel.new
  end

  def create
    @channel = resource_team.channels.build(channel_params)

    if @channel.save
      @channel.channel_invitations.create!(user: current_user)
      redirect_to team_channel_path(resource_team, @channel)
    else
      render :new
    end
  end

  private

  def channel_params
    params.require(:team_channel).permit(:name)
  end
end
