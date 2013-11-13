module HostsHelper
	include ActionView::Helpers::FormOptionsHelper
  def custom_form(name, text, value, type)
    content_tag :div, :class => "control-group" do
      concat(label_tag name, text, :class => "control-label")
  	  concat(content_tag(:div, :class => "controls") do
  	  	case type
        when 'password'
  	  	  password_field_tag name, value, :placeholder => text
  	  	when 'text'
  	  	  text_field_tag name, value, :placeholder => text
        when 'checkbox'
          check_box_tag name
        when 'select'
          select_tag name, options_for_select(value)
  	  	end
  	  end)
    end
  end

end
