class AddTagsToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :tags, :string
    add_column :albums , :publicado , :boolean , :default => true

  end
end
