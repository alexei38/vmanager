require 'libvirt'

module Virt

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
    
  end

end
