class DetallesFactura < ActiveRecord::Base
  attr_accessible :folio, :sku, :cantidad
  
  belongs_to :products
  belongs_to :facturas
end
