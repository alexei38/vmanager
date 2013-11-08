require 'libvirt'

module Virt
  def self.connection(uri)
    Libvirt::open(uri)
  end
end
