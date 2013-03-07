class Product < ActiveRecord::Base
  attr_accessible :descripcion, :p_unit, :u_medida, :sku
  
  default_scope :order => 'descripcion'
     
  #belongs_to :facturasproducto#, :foreign_key => "product_id"#, :foreign_key => "sku"
  has_many :facturas_productos
  belongs_to :user
  
  validates :descripcion, :p_unit, :u_medida, :sku, :presence => { :message => "no puede estar en blanco" }
end
