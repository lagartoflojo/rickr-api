class FotosController < ApplicationController
  
  def usuario
    @fotos = Foto.paginate :conditions => ['usuario_id = ?', params[:id]], :page => params[:page], :order => 'created_at DESC'
    if session[:usuario_id] == params[:id]
      @usuario = Usuario.find(session[:usuario_id])
    else 
      @usuario = Usuario.find(params[:id])
    end
    render :index
  end
  
  # GET /fotos
  # GET /fotos.json
  def index
    @fotos = Foto.paginate :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fotos }
    end
  end

  # GET /fotos/1
  # GET /fotos/1.json
  def show
    @foto = Foto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @foto }
    end
  end

  # GET /fotos/new
  # GET /fotos/new.json
  def new
    @foto = Foto.new
    @foto.albums_fotos.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @foto }
    end
  end

  # GET /fotos/1/edit
  def edit
    @foto = Foto.find(params[:id])
    @foto.albums_fotos.build
  end

  # POST /fotos
  # POST /fotos.json
  def create
    @foto = Foto.new(Foto.foto_upload(params)[:foto])

    respond_to do |format|
      if @foto.save
        format.html { redirect_to @foto, notice: 'Foto was successfully created.' }
        format.json { render json: @foto, status: :created, location: @foto }
      else
        format.html { render action: "new" }
        format.json { render json: @foto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fotos/1
  # PUT /fotos/1.json
  def update
    @foto = Foto.find(params[:id])

    respond_to do |format|
      if @foto.update_attributes(Foto.foto_upload(params)[:foto])
        format.html { redirect_to @foto, notice: 'Foto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @foto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fotos/1
  # DELETE /fotos/1.json
  def destroy
    @foto = Foto.find(params[:id])
    @foto.destroy

    respond_to do |format|
      format.html { redirect_to fotos_url }
      format.json { head :no_content }
    end
  end
end
