class Foto < ActiveRecord::Base
  belongs_to :usuario
  has_many :albums_fotos
  has_many :albums , :through => :albums_fotos
  accepts_nested_attributes_for :albums_fotos, :allow_destroy => true, :reject_if => :all_blank
  
  validates_presence_of :nombre, :archivo, :usuario
  validates_associated :albums_fotos, :usuario
  
  self.per_page = 2
  
  def self.foto_upload(params)
    archivoSubido = params[:foto][:archivo]
    if archivoSubido
      File.open(Rails.root.join('public', 'uploads', archivoSubido.original_filename), 'wb') do |file|
        file.write(archivoSubido.read)
      end
      params[:foto][:archivo] = archivoSubido.original_filename
    end
    params
  end
  
  def archivo_url
    return "/uploads/#{self.archivo}"
  end
end
