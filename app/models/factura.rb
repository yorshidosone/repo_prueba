class Factura < ActiveRecord::Base
  attr_accessible :folio, :fecha, :m_pago#:n_cliente, :m_pago, :folio, :fecha, :total
  
  has_many :facturas_productos#, :foreign_key => "factura_id"#, :foreign_key => "folio"
  has_many :products, :through => :facturas_productos
  
  belongs_to :client
  belongs_to :user
  
  validates :m_pago, :fecha, :folio, :presence => { :message => "no puede estar en blanco" }
  validates :folio, uniqueness: true
  
  #def agregado?(producto)
 #   detallesfacturas.find_by_sku(producto.sku)
#  end  
  
end
