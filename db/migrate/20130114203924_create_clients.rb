class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :nombre
      t.string :RFC
      t.string :estado
      t.string :municipio
      t.string :direccion
      t.integer :CP

      t.timestamps
    end
  end
  
  def self.down
    drop_table :clients
  end
end
