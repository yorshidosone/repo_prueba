class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products, { :id => false } do |t|
      t.integer :sku
      t.string :descripcion
      t.decimal :p_unit
      t.string :u_medida

      t.timestamps
    end
    execute "ALTER TABLE products ADD PRIMARY KEY(sku)"
  end
  
  def self.down
    drop_table :products
  end
end
