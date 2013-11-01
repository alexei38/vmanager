module ApplicationHelper

  def nav_link(link_text, link_path, ctrl)
    class_name = current_controller?(ctrl) ? 'active' : ''
    content_tag(:li, :class => class_name) do
      link_to link_path do
        content_tag(:span, '', :class => 'icon-chevron-right icon-white') + ' ' + link_text
      end
    end
  end

  def current_controller?(ctrl)
    if controller.controller_name == ctrl
      return true
    end
  end

end
