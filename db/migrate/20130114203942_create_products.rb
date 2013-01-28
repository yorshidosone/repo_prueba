class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :sku
      t.string :descripcion
      t.decimal :p_unit
      t.string :u_medida

      t.timestamps
    end
    execute "ALTER TABLE products CHANGE id product_id int NOT NULL AUTO_INCREMENT;"
  end
  
  def self.down
    drop_table :products
  end
end