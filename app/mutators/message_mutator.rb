class MessageMutator
  def self.create(channel, params, current_user)
    message = channel.messages.build(params)
    message.team_id = channel.team_id
    message.user = current_user
    if message.save
      channel.users.each do |user|
        user.notifications.create!(kind: :new_channel_message, resource: message) if user != current_user
      end
    end

    message
  end
end
