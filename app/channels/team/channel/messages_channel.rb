class Team::Channel::MessagesChannel < ApplicationCable::Channel
  def subscribed
    p params
    team_channel = Team::Channel.find(params[:team_channel])
    stream_for team_channel
  end

  def unsubscribed

  end
end
