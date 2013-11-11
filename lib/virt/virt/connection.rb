module Virt
  # Class Connection
  class Connection
  	attr_reader :connection

    def initialize(uri, options = {})
      @connection = Libvirt::open uri
    end

    def version
      connection.libversion
    end

    def disconnect
      connection.close
    end

    def closed?
      connection.closed?
    end

    def secure?
      connection.encrypted?
    end

    def uri
      connection.uri
    end

    def memory_free
      connection.node_free_memory
    end

    def memory_max
      connection.node_get_info.memory * 1024
    end

    def vcpu
      connection.node_get_info.cpus
    end

    def arch
      connection.node_get_info.model
    end

    def hostname
      connection.hostname
    end

    def host
      Host.new
    end
    
  end
end

