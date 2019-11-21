class Web::Channels::MessagesController < Web::Channels::ApplicationController
  def create
    @message = resource_channel.messages.build(message_params)
    @message.team_id = resource_channel.team_id
    @message.user = current_user

    if @message.save
      # flash success
      resource_channel.users.each do |user|
        user.notifications.create!(kind: :new_channel_message, resource: @message) if user != current_user
      end
    else
      # flash fail
    end

    redirect_to team_channel_path(team_id: resource_channel.team_id, id: resource_channel)
  end

  def update
    @message = Team::Channel::Message.find(params[:id])

    if @message.update(message_params)

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
    params.require(:team_channel_message).permit(:content)
  end
end
