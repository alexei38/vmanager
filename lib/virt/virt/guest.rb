module Virt
  #Class Guest
  class Guest
    attr_reader :connection

    def initialize
      @connection = Virt.connection.connection
    end

    def create
    end

    def save
    end

    def info
    end

    def start
    end

    def stop
    end

    def shutdown
    end

    def restart
    end

    def get_xml
    end

  end

end

