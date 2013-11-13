require 'libvirt'
require 'virt/connection'
require 'virt/hypevisor'
require 'virt/guest'


module Virt

  class << self
    attr_reader :connection

    def connect connection_type, ip, login, tcp_password = nil, ssh_port = nil, options = {}
      begin
        @connection = Virt::Connection.new(connection_type, ip, login, tcp_password, ssh_port, options)
      rescue
        @connection = nil
      end
    end

  end

end
