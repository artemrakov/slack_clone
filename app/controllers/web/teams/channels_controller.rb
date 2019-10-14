class Web::Teams::ChannelsController < ApplicationController
  before_action :find_team

  def show
    @channel = @team.find_channel(params[:id])
  end

  def new
    @channel = Team::Channel.new
  end

  def create
    @channel = @team.channels.build(channel_params)

    if @channel.save
      redirect_to team_channel_path(@team, @channel)
    else
      render :new
    end
  end

  private

  def channel_params
    params.require(:team_channel).permit(:name)
  end

  def find_team
    @team = Team.friendly.find(params[:team_id])
  end
end
