class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :archivo
      t.references :usuario

      t.timestamps
    end
    add_index :fotos, :usuario_id
  end
end
