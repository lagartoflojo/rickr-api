json.array! @usuarios do |json, user|
  json.id user.id
  json.full_name user.nombre + ' ' + user.apellido
  json.photo_url image_url user.foto_perfil_url
end