class Factura < ActiveRecord::Base
  attr_accessible :n_cliente, :m_pago, :folio, :fecha, :total
  
  has_many :detallesfacturas, dependent: :destroy
  
  belongs_to :client
  
  validates :n_cliente, :m_pago,  presence: true
  
  def agregado?(producto)
    detallesfacturas.find_by_sku(producto.sku)
  end  
  
end
