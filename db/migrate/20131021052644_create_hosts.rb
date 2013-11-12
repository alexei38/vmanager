class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name,              :null => false, :default => ""
      t.string :ip,              :null => false, :default => ""
      t.integer :ssh_port,              :null => false, :default => "22"
      t.string :login,              :null => false, :default => ""
      t.string :tcp_password,              :null => false, :default => ""
      t.string :connection_type,              :null => false, :default => "ssh"
      t.timestamps
    end
    add_index :hosts, :name,                :unique => true
    add_index :hosts, :ip,                :unique => true
  end
end
