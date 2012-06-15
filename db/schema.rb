# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120614155109) do

  create_table "albums", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.integer  "usuario_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "tags"
    t.boolean  "publicado",   :default => true
  end

  add_index "albums", ["usuario_id"], :name => "index_albums_on_usuario_id"

  create_table "albums_fotos", :force => true do |t|
    t.integer "album_id",                    :null => false
    t.integer "foto_id",                     :null => false
    t.boolean "portada",  :default => false
  end

  add_index "albums_fotos", ["album_id", "foto_id"], :name => "index_albums_fotos_on_album_id_and_foto_id", :unique => true

  create_table "fotos", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "archivo"
    t.integer  "usuario_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "fotos", ["usuario_id"], :name => "index_fotos_on_usuario_id"

  create_table "usuarios", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "usuario"
    t.string   "password"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "foto_perfil"
    t.string   "twitter_token"
    t.string   "twitter_verifier"
    t.string   "api_key"
  end

  add_index "usuarios", ["api_key"], :name => "index_usuarios_on_api_key", :unique => true

end
