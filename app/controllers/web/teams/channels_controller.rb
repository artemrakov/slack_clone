class Web::Teams::ChannelsController < Web::Teams::ApplicationController
  def show
    @channels = resource_team.channels
    @channel = resource_team.find_channel(params[:id])
  end

  def new
    @channel = Team::Channel.new
  end

  def create
    @channel = resource_team.channels.build(channel_params)

    if @channel.save
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
