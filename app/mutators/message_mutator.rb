class MessageMutator
  def self.create(channel, params, current_user)
    message = channel.messages.build(params)
    message.team_id = channel.team_id
    message.user = current_user
    if message.save
      SendNotificationJob.perform_later(users: channel.users.to_a,
                                        resource: message,
                                        current_user: current_user,
                                        kind: :new_channel_message)
    end

    message
  end
end
