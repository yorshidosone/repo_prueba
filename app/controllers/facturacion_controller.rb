class FacturacionController < ApplicationController
  def facturar
    render :pdf => "factura", :layout => false, :file => "/home/aggero/Desktop/factura.html", :page_height => '5in', :page_width => '4in' #:template => '/clients/index' 
  end
end
