module ApplicationHelper
  include AuthManagment

  def active?(path, options = {})
    if options.key? :active_if
      'active' if options[:active_if]
    elsif current_page?(path)
      'active'
    end
  end

  def nav_menu_item(name, path = '#', options = {})
    assembled_options = options.merge(class: "nav-link #{active?(path)}")
    content_tag :li, class: 'nav-item' do
      link_to path, assembled_options do
        content_tag(:div, name)
      end
    end
  end

  def user_avatar(user, size=40)
    if user.avatar.attached?
      user.avatar
    else
      "https://via.placeholder.com/#{size}"
    end
  end

  def class_for_notification(notification)
    ::NotificationHelper.notification_class(notification)
  end

  def message_for_notification(notification)
    ::NotificationHelper.message(notification)
  end

  def onboarding_step_icon(step_completed)
    color = step_completed ? 'text-success' : 'text-muted'
    content_tag :i, nil, class: ["fas", "fa-check", color], style: 'margin-right: 5px'
  end
end

