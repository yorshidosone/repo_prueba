class FacturacionController < ApplicationController
  def facturar
    render :pdf => "client", :template => '/clients/index', :page_size => "A2"
  end
end
