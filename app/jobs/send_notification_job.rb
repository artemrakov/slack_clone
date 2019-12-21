class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(user_ids:, resource_type:, resource_id:, current_user_id:, kind:)
    users = User.where(id: user_ids)
    resource = resource_type.constantize.find(resource_id)

    users.each do |user|
      user.notifications.create!(kind: kind, resource: resource) if user.id != current_user_id
    end
  end
end
