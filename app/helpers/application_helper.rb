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
end
