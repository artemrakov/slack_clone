class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(users:, resource:, current_user:, kind:)
    users.each do |user|
      user.notifications.create!(kind: kind, resource: resource) if user != current_user
    end
  end
end
