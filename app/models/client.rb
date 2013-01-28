class Client < ActiveRecord::Base
  attr_accessible :nombre, :RFC, :estado, :municipio, :CP, :direccion
  
  has_many :products, dependent: :destroy
  has_many :facturas, dependent: :destroy

  
  belongs_to :user
  
  validates :nombre, :RFC, :estado, :municipio, :CP, :presence => { :message => "no puede estar vacio" }
  validates :RFC, :length => { :maximum => 13, :minimum => 12, :message => "de longitud incorrecta, favor de verificar" }
  validates :RFC, :format => { :with => %r{^[A-Za-z]{4}\d{6}([A-Za-z\d]{3})?$}, :message => "no es del formato correcto" }
  
end
