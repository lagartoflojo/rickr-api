require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  setup do
    @usuario = usuarios(:one)
  end
  # Login
  test "login" do
    puts @usuario.nombre
    assert_not_nil Usuario.login(@usuario.usuario, @usuario.password)
    assert_equal(false,Usuario.login('nombre no existente', 'password no existente'))
  end
end
