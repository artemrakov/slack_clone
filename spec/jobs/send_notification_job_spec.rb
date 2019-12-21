require 'rails_helper'

RSpec.describe SendNotificationJob, type: :job do
  it 'creates notification for specific users' do
    users = create_list(:user, 2)
    user_ids = users.map(&:id)
    current_user = create(:user)
    message = create(:message, user: current_user)
    kind = :new_channel_message

    SendNotificationJob.perform_now(
      user_ids: user_ids,
      resource_type: message.class.to_s,
      resource_id: message.id,
      current_user_id: current_user.id,
      kind: kind
    )

    notifications = Notification.where(user_id: [user_ids], kind: kind)
    notifications_user_ids = notifications.map(&:user_id)
    expect(notifications_user_ids).to eq user_ids
    expect(notifications_user_ids).to_not include current_user.id
  end
end
