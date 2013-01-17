class Product < ActiveRecord::Base
  attr_accessible :descripcion, :p_unit, :u_medida, :sku
  
  belongs_to :user
  
  has_many :detallesfacturas
  
  
  validates :descripcion, :p_unit, :u_medida, :sku, presence: true
end
