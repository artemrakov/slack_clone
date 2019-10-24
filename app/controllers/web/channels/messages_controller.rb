class Web::Channels::MessagesController < ApplicationController
  def create
    @message = resource_channel.messages.build(message_params) 
    @message.team_id = resource_channel.team_id

    if @message.save
      # flash success 
    else 
      # flash fail
    end

    redirect_to team_channel_path(@channel)
  end

  private

  def message_params
    params.require(:channel_message).permit(:content)
  end
end
