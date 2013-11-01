class ApplicationController < ActionController::Base

  #layout :layout_by_resource

  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end


  before_filter :authenticate_user!
  protect_from_forgery


  protected

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end

end
