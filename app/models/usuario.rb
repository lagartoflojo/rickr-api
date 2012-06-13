class Usuario < ActiveRecord::Base
  has_many :fotos, :dependent => :destroy 
  has_many :albums, :dependent => :destroy
  
  validates_presence_of :nombre, :apellido, :usuario, :password
  validates_confirmation_of :password

  before_create :set_api_key
  
  def self.login(nombreUsuario, password)
    usuario = self.find_by_usuario(nombreUsuario)
    if usuario && password == usuario.password
      usuario
    else
      false
    end
  end
  
  def foto_perfil_url
    "/uploads/#{self.foto_perfil}"
  end
  
  def self.foto_perfil_upload(params)
    archivoSubido = params[:usuario][:foto_perfil]
    if archivoSubido
      File.open(Rails.root.join('public', 'uploads', archivoSubido.original_filename), 'wb') do |file|
        file.write(archivoSubido.read)
      end
      params[:usuario][:foto_perfil] = archivoSubido.original_filename
    end
    params
  end

  private
  def set_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end
  
end
