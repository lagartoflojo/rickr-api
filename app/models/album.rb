class Album < ActiveRecord::Base
  belongs_to :usuario
  has_many :albums_fotos
  has_many :fotos, :through => :albums_fotos
  
  validates_presence_of :nombre, :usuario
  validates_associated :usuario
  
  scope :publicados, where("publicado = ?", true) 
end
