class User < ActiveRecord::Base
  attr_accessible :empresa, :rfc, :reg_fiscal, :tel, :cp, :estado, :ciudad, :direccion
  
  has_many :clients
  has_many :facturas
  
  validates :empresa, :reg_fiscal, :rfc, :tel, :estado, :ciudad, :direccion, :presence => { :message => "no puede estar vacío" }
  validates :empresa, :length => { :maximum => 60, :minimum => 4, :message => "de longitud incorrecta, debe ser de 4 a 60 caracteres" }
  validates :rfc, :format => { :with => %r{^[A-Za-z]{4}\d{6}([A-Za-z\d]{3})?$}, :message => "no es del formato correcto" }
end
