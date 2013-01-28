class CreateFacturas < ActiveRecord::Migration
  def self.up
    create_table :facturas do |t|
      t.integer :folio
      t.date :fecha
      t.references :client
      t.references :user
      t.references :facturas_producto
      t.string :m_pago
      t.decimal :total

      t.timestamps
    end
    execute "ALTER TABLE facturas CHANGE id factura_id int NOT NULL AUTO_INCREMENT;"
  end
  
  def self.down
    drop_table :facturas
  end  
end
