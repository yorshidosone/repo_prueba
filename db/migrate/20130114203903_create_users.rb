class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :rfc
      t.string :empresa
      t.string :reg_fiscal
      t.string :direccion
      t.string :estado
      t.string :ciudad
      t.integer :cp
      t.string :tel
      
    end
  end
  
  def self.down
    drop_table :users
  end
end
