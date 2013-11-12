class Host < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :ip
  validates_presence_of :connection_type
  validates :tcp_password, :presence => false, :confirmation =>true
  attr_accessible :connection, :connection_type, :name, :ip, :ssh_login, :ssh_port, :tcp_login, :tcp_password, :tcp_password_confirmation

  def connect
  	begin
      if connection_type == 'ssh'
  	    @connection =  Virt.connect("qemu+ssh://#{ssh_login}@#{self.ip}/system")
      else
        @connection =  nil
      end

  	end
  end

  def connect?
  	begin
  	  self.connect
  	rescue
  	  return nil
  	end
  end

  def get_memory_max
  	if connect?
      @connection.memory_max
    else
      0
    end
  end

  def get_memory_free
  	if connect?
      @connection.memory_free
    else
      0
    end
  end

  def get_vcpu
  	if connect?
      @connection.vcpu
    else
      0
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
