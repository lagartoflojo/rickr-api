# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
john = Usuario.create( :nombre => 'John', :apellido => 'Appleseed', :usuario => 'john', :password => '123456')
paul = Usuario.create( :nombre => 'Paul', :apellido => 'Frank', :usuario => 'paul', :password => '123456')

primerAlbum = Album.create(:nombre => 'Primer Album', :descripcion => 'Mis primeras fotos', :usuario => john, :tags => 'primeras, john, reflex')
segundoAlbum = Album.create(:nombre => 'Album de Paul', :descripcion => 'Aca pondre mis trabajos', :usuario => paul, :tags => 'ilustracion')

fotoPerfil = Foto.create(:nombre => 'Perfil', :descripcion => 'Foto de perfil', :archivo => 'john.jpg', :usuario => john  )
john_foto_1 = Foto.create(:nombre => 'Mi gato', :descripcion => 'Este es mi gato, tiene 4 agnos con nosotros', :archivo => 'cat.jpg', :usuario => john  )
john_foto_2 = Foto.create(:nombre => 'Mi dibujo', :descripcion => 'Un dibujo', :archivo => 'deanoakley_2.jpg', :usuario => john  )

john_AlbumsFotos = AlbumsFoto.create([{:foto => fotoPerfil, :album => primerAlbum, :portada => true},{:foto => john_foto_1, :album => primerAlbum, :portada => false}, {:foto => john_foto_2, :album => primerAlbum, :portada => false}])

paul_foto_1 = Foto.create(:nombre => 'Mi dibujo', :descripcion => 'Un dibujo', :archivo => 'deanoakley_1.jpg', :usuario => paul  )
paul_AlbumsFotos = AlbumsFoto.create(:foto => paul_foto_1, :album => segundoAlbum, :portada => true)