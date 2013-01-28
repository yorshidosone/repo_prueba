class FacturasProducto < ActiveRecord::Base
  #attr_accessible :factura_id, :product_id
  
  belongs_to :factura
  belongs_to :product
end
