class Product < ActiveRecord::Base
  attr_accessible :descripcion, :p_unit, :u_medida, :sku
  
  belongs_to :user
  
  has_many :facturas_productos#, :foreign_key => "product_id"#, :foreign_key => "sku"
  has_many :facturas, :through => :facturas_productos
  
  
  validates :descripcion, :p_unit, :u_medida, :sku, :presence => { :message => "no puede estar vacío" }
end
