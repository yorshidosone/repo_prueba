class Client < ActiveRecord::Base
  attr_accessible :nombre, :RFC, :estado, :municipio, :CP, :direccion
  
  has_many :products, dependent: :destroy
  has_many :facturas, dependent: :destroy
  
  belongs_to :user
  
  validates :nombre, :RFC, :estado, :municipio, :CP, presence: true
  validates :RFC, :length => { :maximum => 13, :minimum => 12}
end
