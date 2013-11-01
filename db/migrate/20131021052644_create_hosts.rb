class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name,              :null => false, :default => ""
      t.string :host,              :null => false, :default => ""
      t.string :port,              :null => false, :default => ""
      t.timestamps
    end
  end
end
