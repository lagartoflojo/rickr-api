class AddPortadaToAlbumsFotos < ActiveRecord::Migration
  def change
    add_column :albums_fotos, :portada, :boolean, :default => false

  end
end
