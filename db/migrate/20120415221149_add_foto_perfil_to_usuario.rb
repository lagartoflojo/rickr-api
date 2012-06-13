class AddFotoPerfilToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :foto_perfil, :string

  end
end
