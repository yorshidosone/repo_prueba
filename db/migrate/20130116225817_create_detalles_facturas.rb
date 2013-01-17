class CreateDetallesFacturas < ActiveRecord::Migration
  def self.up
    create_table :detalles_facturas do |t|
      t.integer :folio
      t.integer :sku
      t.integer :cantidad
      t.decimal :p_unit
      t.string :u_medida
      t.string :descripcion

      t.timestamps
    end
  end
  
  def self.down
    drop_table :detalles_facturas
  end
end
