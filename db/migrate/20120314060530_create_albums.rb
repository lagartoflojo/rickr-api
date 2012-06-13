class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :nombre
      t.string :descripcion
      t.references :usuario

      t.timestamps
    end
    add_index :albums, :usuario_id
  end
end
