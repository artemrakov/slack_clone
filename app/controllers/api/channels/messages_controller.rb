class Api::Channels::MessagesController < Api::Channels::ApplicationController
  def create
    @message = resource_channel.messages.build(message_params)
    @message.team_id = resource_channel.team_id
    @message.user = current_user

    if @message.save
      resource_channel.users.each do |user|
        user.notifications.create!(kind: :new_channel_message, resource: @message) if user != current_user
      end

      render json: @message, status: :created
    else
      render json: @message, serializer: ErrorSerializer, status: :unprocessable_entity
    end
  end

  def update
    @message = Team::Channel::Message.find(params[:id])

    if @message.update(message_params)
      render json: @message, status: :ok
    else
      render json: @message, serializer: ErrorSerializer, status: :unprocessable_entity
    end

  end

  def destroy
    @message = Team::Channel::Message.find(params[:id])

    if @message.destroy
      render json: @message, status: :ok
    else
      render json: @message, serializer: ErrorSerializer, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:team_channel_message).permit(:content)
  end
end
