module HostsHelper

  def get_allhost
    hosts = Host.order('name ASC')
  end

end
