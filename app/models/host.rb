class Host < ActiveRecord::Base
  attr_accessible :name, :host, :port

  def connected?
   	begin
      Virt.connect("qemu+ssh://root@#{self.ip}/system")
      return true
    rescue
      return nil
    end
  end 

  def self.test
  	puts self.name
  end
end
