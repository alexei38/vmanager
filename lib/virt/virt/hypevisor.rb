module Virt
  # Class Hypervisor
  class Hypervisor < Virt::Connection
    attr_reader :connection

    def initialize
      @connection = Virt.connection.connection
    end

    def guests
      {:running => running_guests, :defined => defined_guests}
    end

    def running_guests
      connection.list_domains.map do |domain|
        find_guest_by_id(domain)
      end
    end

    def defined_guests
      connection.list_defined_domains.map do |domain|
        find_guest_by_name domain
      end
    end

    def find_guest_by_name name
      if connection.lookup_domain_by_name name
        return guest({:name => name})
      end
    end

    def find_guest_by_id id
      Array(id).map do |did|
        return guest({:name => connection.lookup_domain_by_id(did).name})
      end
    end

    def guest opts
      Guest.new opts
    end

  end
end

