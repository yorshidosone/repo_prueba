class CreateFacturasProductos < ActiveRecord::Migration
  def change
    create_table :facturas_productos do |t|
      t.integer :factura_id
      t.integer :product_id

    end
    
  end
end
