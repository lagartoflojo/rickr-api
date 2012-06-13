require 'test_helper'

class UsuariosControllerTest < ActionController::TestCase
  setup do
    @usuario = usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuario" do
    nombreArchivo = 'public/uploads/cat.jpg'
    archivo = Rack::Test::UploadedFile.new(nombreArchivo, "image/jpeg")
    assert_difference('Usuario.count') do
      post :create, :usuario => { :nombre => 'Steve', :apellido => 'Smith', :usuario => 'steve', :password => '123456', :foto_perfil => archivo }
    end
    assert_not_nil session[:usuario_id]
    @usuario_registrado = Usuario.find(session[:usuario_id])
    assert File.exist? "public#{@usuario_registrado.foto_perfil_url}"
    assert_redirected_to perfil_path
  end

  test "should show usuario" do
    get :show, id: @usuario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usuario
    assert_response :success
  end

  test "should update usuario" do
    session[:usuario_id] = @usuario.id
    put :update, id: @usuario, usuario: @usuario.attributes
    
    assert_redirected_to :root
  end

  test "should destroy usuario" do
    assert_difference('Usuario.count', -1) do
      delete :destroy, id: @usuario
    end

    assert_redirected_to usuarios_path
  end
end