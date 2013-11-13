class Host < ActiveRecord::Base
  validates_presence_of :name, uniqueness: { case_sensitive: false }
  validates_presence_of :ip, uniqueness: { case_sensitive: false }
  validates_presence_of :connection_type
  validates_confirmation_of :tcp_password, :if => :validate_password?
  validates :ssh_port, :numericality => true
  attr_accessible :connection, :connection_type, :name, :ip, :login, :ssh_port, :tcp_password, :tcp_password_confirmation

  def connect
    @connection = Virt.connect(self.connection_type, self.ip, self.login, self.tcp_password, self.ssh_port) 
  end

  def connect?
	  self.connect
  end

  def get_memory_max
  	if connect?
      @connection.connection.node_get_info.memory * 1024
    else
      0
    end
  end

  def get_memory_free
  	if connect?
      @connection.connection.node_free_memory
    else
      0
    end
  end

  def get_vcpu
  	if connect?
      @connection.connection.node_get_info.cpus
    else
      0
    end
  end

  def get_arch
  	if connect?
      @connection.connection.node_get_info.model
    else
      "&nbsp;"
    end
  end

  private

  def validate_password?
    if tcp_password.present? || tcp_password_confirmation.present?
      return true
    else
      return false
    end
  end

end
