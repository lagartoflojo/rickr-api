class AlbumsFoto < ActiveRecord::Base
  belongs_to :foto
  belongs_to :album
end
