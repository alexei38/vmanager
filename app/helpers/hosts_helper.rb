module HostsHelper

  def custom_form(name, text, password=nil)
    content_tag :div, :class => "control-group" do
      concat(label_tag name, text, :class => "control-label")
  	  concat(content_tag(:div, :class => "controls") do
  	  	if password
  	  	  password_field_tag name, nil, :placeholder => text
  	  	else
  	  	  text_field_tag name, nil, :placeholder => text
  	  	end
  	  end)
    end
  end

end
