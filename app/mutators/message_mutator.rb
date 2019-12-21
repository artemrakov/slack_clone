class MessageMutator
  def self.create(channel, params, current_user)
    message = channel.messages.build(params)
    message.team_id = channel.team_id
    message.user = current_user
    if message.save
      SendNotificationJob.perform_later(
        user_ids: channel.users.ids,
        resource_id: message.id,
        resource_type: message.class.to_s,
        current_user_id: current_user.id,
        kind: :new_channel_message
      )
    end

    message
  end
end
