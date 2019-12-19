class NotificationHelper
  class << self
    include Rails.application.routes.url_helpers

    def notification_class(notification)
      notification_class_map = {
        new_personal_message: 'fa-file-alt',
        new_channel_message: 'fa-comment',
        new_tagged_message: 'fa-comment'
      }

      notification_class_map[notification.kind.to_sym]
    end

    def message(notification)
      raise [notification, notification.user].inspect unless notification.resource

      params = send("#{notification.kind}_params", notification.resource)
      I18n.t("#{notification.kind}_html", scope: [:notifications], **params)
    end

    def new_personal_message_params(resource)
      {
        user: resource.user,
        user_path: team_channel_path(resource.team, resource.channel),
        message_path: team_channel_path(resource.team, resource.channel, anchor: "message-#{resource.id}")
      }
    end

    def new_channel_message_params(resource)
      {
        user: resource.user,
        channel: resource.channel,
        user_path: team_channel_path(resource.team, resource.channel),
        message_path: team_channel_path(resource.team, resource.channel, anchor: "message-#{resource.id}")
      }
    end

    def new_tagged_message_params(resource)
      {
        user: resource.user,
        user_path: team_channel_path(resource.team, resource.channel),
        message_path: team_channel_path(resource.team, resource.channel, anchor: "message-#{resource.id}")
      }
    end
  end
end
