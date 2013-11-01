class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :name,              :null => false, :default => ""
      t.string :virtio,              :null => false, :default => ""
      t.string :arch,              :null => false, :default => ""
      t.string :vcpu_type,              :null => false, :default => ""
      t.string :vcpu,              :null => false, :default => ""
      t.string :vmem,              :null => false, :default => ""
      t.timestamps
    end
  end
end
