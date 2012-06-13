class CreateAlbumFotosJoinTable < ActiveRecord::Migration
  def change
    create_table :albums_fotos do |t|
      t.references :album, :null => false
      t.references :foto, :null => false
    end
    add_index(:albums_fotos , [:album_id, :foto_id], :unique => true)
  end
end
