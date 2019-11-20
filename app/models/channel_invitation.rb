class ChannelInvitation < ApplicationRecord
  belongs_to :user
  belongs_to :channel, class_name: "Team::Channel"
end
