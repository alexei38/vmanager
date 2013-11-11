require 'libvirt'
require 'virt/connection'
require 'virt/hypevisor'
require 'virt/guest'


module Virt

  class << self

    def connect uri, options = {}
      @connection = Virt::Connection.new uri, options
    end

    def connection
      return @connection if @connection and !@connection.closed?
      raise "No Connection or connection has been closed"
    end

  end

end
