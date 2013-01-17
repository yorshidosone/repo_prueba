class User < ActiveRecord::Base
  attr_accessible :empresa, :rfc, :reg_fiscal, :tel, :cp, :estado, :ciudad, :direccion
  
  has_many :clients
end
