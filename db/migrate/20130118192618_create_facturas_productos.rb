class CreateFacturasProductos < ActiveRecord::Migration
  def self.up
    create_table :facturas_productos do |t|
      t.references :factura
      t.references :product

      t.timestamps
    end
  end
  
  def self.down
    drop_table :facturas_productos
  end
end
