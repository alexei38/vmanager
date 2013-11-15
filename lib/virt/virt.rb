require 'libvirt'
require 'virt/hypevisor'
#require 'virt/guest'

module Virt
  # Class Connection
  class Connection
    attr_reader :connection

    def initialize(connection_type, ip, login, tcp_password = nil, ssh_port = nil, options = {})
      begin
        if connection_type == 'tcp'
          uri = "qemu+tcp://#{ip}/system"
          @connection = Libvirt::open_auth(uri, [Libvirt::CRED_AUTHNAME, Libvirt::CRED_PASSPHRASE]) do |cred|
            case cred['type']
              when ::Libvirt::CRED_AUTHNAME
                login
              when ::Libvirt::CRED_PASSPHRASE
                tcp_password
            end
          end
        elsif connection_type == 'ssh'
          uri = "qemu+ssh://#{login}@#{ip}/system"
          @connection = Libvirt::open (uri)
        end
      rescue ::Libvirt::ConnectionError
        @connecton = nil
      end
    end

    def terminate
      @connecton.close if @connecton and !@connecton.closed?
    end

  end
end
