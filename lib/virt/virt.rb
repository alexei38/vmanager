require 'libvirt'
require 'virt/hypevisor'
require 'virt/guest'


module Virt

  class << self
    attr_reader :connection
    def connection_tcp(uri, login, tcp_password)
      @connection = Libvirt::open_auth("qemu+tcp://192.168.226.84/system", [Libvirt::CRED_AUTHNAME, Libvirt::CRED_PASSPHRASE]) do |cred|
        case cred['type']
          when ::Libvirt::CRED_AUTHNAME
            "user"
          when ::Libvirt::CRED_PASSPHRASE
            "password"
        end
      end
    end

    def connection_ssh(uri)
      @connection = Libvirt::open uri
    end

    def connect(connection_type, ip, login, tcp_password = nil, ssh_port = nil, options = {})
      if connection_type == 'tcp'
        connection_tcp("qemu+tcp://#{ip}/system", login, tcp_password)
      elsif connection_type == 'ssh'
        connection_ssh("qemu+ssh://#{login}@#{ip}/system")
      end
    end

    def host
      Host.new
    end

  end

end
