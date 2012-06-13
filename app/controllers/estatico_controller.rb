class EstaticoController < ApplicationController
  def index
    @foto_home = Foto.order("created_at DESC").first
    client = TwitterOAuth::Client.new
    @tweets = client.user_timeline(:screen_name => 'rickttr', :count => 3)
  end

  def login
    if usuario = Usuario.login(params[:usuario][:nick], params[:usuario][:password])
      session[:usuario_id] = usuario.id
      redirect_to perfil_path, :notice => "Bienvenido #{usuario.nombre}!"
    else
      redirect_to :root, :notice => "Nombre de usuario o password incorrecto!"
    end
  end
  
  def perfil
    if params[:nombre_usuario]
      if usuario = Usuario.find_by_usuario(params[:nombre_usuario])
        @usuario = usuario
      else
        redirect_to :root, :notice => "No existe un usuario asociado!"
      end
    elsif session[:usuario_id]
      @usuario = Usuario.find(session[:usuario_id])
      if @usuario.twitter_token
        client = TwitterOAuth::Client.new(
            :consumer_key => 'pL1pKkqHiHdnsjonRnDg',
            :consumer_secret => 'nCn8hV7DhEA3rK3O0K9madWXNdmODvMRLeFGhKJBM',
            :token => @usuario.twitter_token,
            :secret => @usuario.twitter_verifier
            )
        @tweets = client.user_timeline(:count => 3)
      end
    else
      redirect_to :root, :notice => "No existe un usuario asociado!"
    end
  end
  
  def logout
    reset_session
    redirect_to :root, :notice => "Has salido exitosamente de rickr"
  end
  
  def buscar
     if params[:busqueda]
       @resultados = case params[:tipo]
         when 'usuarios' then Usuario.where('nombre LIKE ? OR apellido LIKE ? OR usuario LIKE ?', "%#{params[:busqueda]}%","%#{params[:busqueda]}%","%#{params[:busqueda]}%")
         when 'albums' then Album.where('nombre LIKE ? OR descripcion LIKE ?', "%#{params[:busqueda]}%","%#{params[:busqueda]}%")
         else Foto.where('nombre LIKE ? OR descripcion LIKE ?', "%#{params[:busqueda]}%","%#{params[:busqueda]}%")
       end
       @busqueda = params[:busqueda]
       @tipo = params[:tipo]
     else
       redirect_to :root, :notice => "No has introducido un termino de busqueda!"
     end
   end
   
   def autenticar_twitter
     if session[:usuario_id]
       client = TwitterOAuth::Client.new(
           :consumer_key => 'pL1pKkqHiHdnsjonRnDg',
           :consumer_secret => 'nCn8hV7DhEA3rK3O0K9madWXNdmODvMRLeFGhKJBM'
       )
       request_token = client.request_token(:oauth_callback => 'http://rickr.dev/autenticacion_twitter_exitosa')
       session[:twitter_request_token] = request_token
       redirect_to request_token.authorize_url
     else
       redirect_to :root, notice: "Debes estar logeado para poder autenticarte con Twitter!"
     end
   end
   
   def autenticacion_twitter_exitosa
     if params[:oauth_token]
       usuario = Usuario.find(session[:usuario_id])
       client = TwitterOAuth::Client.new(
           :consumer_key => 'pL1pKkqHiHdnsjonRnDg',
           :consumer_secret => 'nCn8hV7DhEA3rK3O0K9madWXNdmODvMRLeFGhKJBM'
       )
       request_token = session[:twitter_request_token]
       access_token = client.authorize(
         request_token.token,
         request_token.secret,
         :oauth_verifier => params[:oauth_verifier]
       )
       usuario.twitter_token = access_token.token
       usuario.twitter_verifier = access_token.secret
       usuario.save
       redirect_to(:root, :notice => "Conexion con Twitter exitosa!")
     else
       redirect_to(:root, :notice => "Conexion con Twitter tuvo problemas. Por favor intenta nuevamente")
     end
   end
   
   def revocar_twitter
     usuario = Usuario.find(session[:usuario_id])
     usuario.twitter_token = nil
     usuario.twitter_verifier = nil
     usuario.save
     redirect_to :root, notice: 'Conexion con Twitter revocada!'
   end
end
