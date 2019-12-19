class Team::ChannelsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "team_channel"
  end

  def unsubcribed
  end
end
