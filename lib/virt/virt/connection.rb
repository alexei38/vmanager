module Virt
  # Class Connection
  class Connection
  	attr_reader :connection

    def initialize(connection_type, ip, login, tcp_password = nil, ssh_port = nil, options = {})
      if connection_type == 'tcp'
        connection_tcp("qemu+tcp://#{ip}/system", login, tcp_password)
      elsif connection_type == 'ssh'
        connection_ssh("qemu+ssh://#{login}@#{ip}/system")
      end
    end

    def connection_tcp(uri, login, tcp_password)
      @connection = Libvirt::open_auth(uri, [Libvirt::CRED_AUTHNAME, Libvirt::CRED_PASSPHRASE]) do |cred|
        case cred['type']
          when ::Libvirt::CRED_AUTHNAME
            login
          when ::Libvirt::CRED_PASSPHRASE
            tcp_password
        end
      end
    end

    def connection_ssh(uri)
      @connection = Libvirt::open uri
    end

    def host
      Host.new
    end
    
  end
end

