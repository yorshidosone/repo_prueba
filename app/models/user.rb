class User < ActiveRecord::Base
  attr_accessible :user_id, :empresa, :rfc, :reg_fiscal, :tel, :cp, :estado, :ciudad, :direccion, :password, :password_confirmation
  
  has_secure_password
  
  has_many :clients
  has_many :facturas
  
  #VALIDACIONES DE CAMPOS
  validates :empresa, :reg_fiscal, :rfc, :tel, :estado, :ciudad, :direccion, :presence => { :message => "no puede estar en blanco" }
  validates :empresa, :length => { :maximum => 60, :minimum => 4, :message => "de longitud incorrecta, debe ser de 4 a 60 caracteres" }
  validates :rfc, :length => { :maximum => 13, :minimum => 12, :message => "de longitud incorrecta, favor de veriicar" }
  validates :rfc, :format => { :with => %r{^([A-Za-z]{4}|[A-Za-z]{3})\d{6}([A-Za-z\d]{3})?$}, :message => "no es del formato correcto" }
  
  #CONTRASEÑAS
  validates :password, :presence => { :message => "no puede estar en blanco" }
  validates :password, :length => { minimum: 6, :message => "es muy corto, debe tener al menos 6 caracteres" }
  validates :password_confirmation, :presence => { :message => "no puede estar en blanco" }
  
end
