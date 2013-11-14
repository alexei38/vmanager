module Virt

  class Connection

    def guest_create
    end

    def guest_save
    end

    def guest_info
    end

    def guest_start
      raise "Guest not created, can't start" if new?
      @domain.create unless running?
      running?
    end

    def guest_shutdown
      stop
    end

    def guest_poweroff
      stop(true)
    end

    def guest_uuid
      @domain.uuid unless new?
    end

    def guest_restart
    end

    def guest_xml
    end

  end

end

