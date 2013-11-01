class ApplicationController < ActionController::Base

  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end


  before_filter :authenticate_user!
  protect_from_forgery

end
