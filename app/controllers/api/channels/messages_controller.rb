class Api::Channels::MessagesController < Api::Channels::ApplicationController
  def create
    @message = MessageMutator.create(resource_channel, message_params, current_user)
    if @message.persisted?
      Team::Channel::MessagesChannel.broadcast_to resource_channel, { data: @message.attributes.merge(user: @message.user), type: "ADD_MESSAGE" }
      render json: @message.to_json(include: :user), status: :created
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
      Team::Channel::MessagesChannel.broadcast_to resource_channel, { data: @message.id, type: "DELETE_MESSAGE" }
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
