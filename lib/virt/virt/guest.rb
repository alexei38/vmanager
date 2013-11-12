module Virt
  #Class Guest
  class Guest
    attr_reader :connection, :name

    def initialize options = {}
      @connection = Virt.connection.connection
      @name = options[:name]
      fetch_guest
    end

    def new?
      @domain.nil?
    end

    def create
    end

    def save
    end

    def info
    end

    def start
      raise "Guest not created, can't start" if new?
      @domain.create unless running?
      running?
    end

    def shutdown
      stop
    end

    def poweroff
      stop(true)
    end

    def uuid
      @domain.uuid unless new?
    end

    def to_s
      name.to_s
    end

    def restart
    end

    def get_xml
    end

    protected

    def fetch_guest
      @domain = connection.lookup_domain_by_name(name)
    end

  end

end

