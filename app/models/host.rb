class Host < ActiveRecord::Base
  attr_accessible :name, :host, :port, connection

  def connect
  	begin
  	  @connection =  Virt.connect("qemu+ssh://root@#{self.host}/system")
  	end
  end

  def connect?
  	begin
  	  self.connect
  	  return true
  	rescue
  	  return nil
  	end
  end

  def get_memory_max
  	if connect?
      @connection.memory_max
    end
  end

  def get_memory_free
  	if connect?
      @connection.memory_free
    end
  end

  def get_vcpu
  	if connect?
      @connection.vcpu
    end
  end

  def get_arch
  	if connect?
      @connection.arch
    end
  end

  def get_uri
  	if connect?
      @connection.uri
    end
  end

  def get_hostname
  	if connect?
      @connection.hostname
    end
  end
end
