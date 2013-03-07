require 'num.rb'
class Factura < ActiveRecord::Base
  attr_accessible :client_id, :folio, :fecha, :m_pago, :total, :facturas_productos_attributes#:n_cliente, :m_pago, :folio, :fecha, :total
  
  
  has_many :facturas_productos, dependent: :destroy#, :foreign_key => "factura_id"#, :foreign_key => "folio"
  accepts_nested_attributes_for :facturas_productos, :reject_if => lambda { |a| a[:product_id].blank? }, :allow_destroy => true
  #has_many :products, :through => :facturasproductos
  
  
  belongs_to :client
  belongs_to :user
  
  validates :m_pago, :fecha, :folio, :presence => { :message => "no puede estar en blanco" }
  validates :folio, uniqueness: true

end
