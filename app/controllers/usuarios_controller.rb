class UsuariosController < ApplicationController
  layout 'layout_limpio'
  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])
    respond_to do |format|
      format.html { redirect_to :controller => 'estatico', :action => 'perfil', :nombre_usuario => @usuario.usuario }
      format.json { render json: @usuario }
    end
    
  end

  # GET /usuarios/new
  # GET /usuarios/new.json
  def new
    @usuario = Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end
  
  def editar_perfil
    @usuario = Usuario.find_by_id(session[:usuario_id])
    if !@usuario
      return redirect_to :root, notice: 'Debes estar logeado para poder editar tu perfil'
    end
    render 'edit'
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(Usuario.foto_perfil_upload(params)[:usuario])

    respond_to do |format|
      if @usuario.save
        session[:usuario_id] = @usuario.id
        format.html { redirect_to perfil_path, notice: 'Te has registrado exitosamente!' }
        format.json { render json: @usuario, status: :created, location: @usuario }
      else
        format.html { render action: "new" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /usuarios/1
  # PUT /usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(Usuario.foto_perfil_upload(params)[:usuario])
        format.html { redirect_to :root, notice: 'Has actualizado tus datos exitosamente!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to usuarios_url }
      format.json { head :no_content }
    end
  end
end
