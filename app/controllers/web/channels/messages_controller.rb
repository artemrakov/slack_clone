class Web::Channels::MessagesController < Web::Channels::ApplicationController
  def create
    @message = resource_channel.messages.build(message_params)
    @message.team_id = resource_channel.team_id

    if @message.save
      # flash success
    else
      # flash fail
    end

    redirect_to team_channel_path(team_id: resource_channel.team_id, id: resource_channel)
  end

  def update
    @message = Team::Channel::Message.find(params[:id])

    if @message.update(message_params)

    else

    end

    redirect_to team_channel_path(team_id: resource_channel.team_id, id: resource_channel)
  end

  def destroy
    @message = Team::Channel::Message.find(params[:id])

    if @message.destroy
      # flash success
    else
      # flash fail
    end

    redirect_to team_channel_path(team_id: resource_channel.team_id, id: resource_channel)
  end

  private

  def message_params
    params.require(:channel_message).permit(:content)
  end
end
