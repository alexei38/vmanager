module Virt
  def self.connection(uri)
    @connect = Libvirt::open(uri)
  end
end
