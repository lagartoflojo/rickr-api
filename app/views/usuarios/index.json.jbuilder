json.array! @usuarios do |json, user|
  json.full_name user.nombre + ' ' + user.apellido
  json.user_name user.usuario
  json.photo_url asset_url(user.foto_perfil_url)
end