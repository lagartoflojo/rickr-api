require 'test_helper'

class EstaticoControllerTest < ActionController::TestCase
  setup do
    @usuario = usuarios(:one)
  end
  
  # Index se carga correctamente y muestra una foto o nada
  test "cargar indice" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foto_home)
  end
  
  # Login
  test "login" do 
    post :login, :usuario => {:nick => 'peter', :password => '123456'}
    assert_redirected_to perfil_path
    assert_not_nil session[:usuario_id]
  end
end