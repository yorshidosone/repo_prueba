class CreateFacturas < ActiveRecord::Migration
  def self.up
    create_table :facturas, {:id => false} do |t|
      t.integer :folio
      t.date :fecha
      t.string :n_cliente
      t.string :m_pago
      t.decimal :total

      t.timestamps
    end
    execute "ALTER TABLE facturas ADD PRIMARY KEY (folio);"
  end
  
  def self.down
    drop_table :facturas
  end  
end
