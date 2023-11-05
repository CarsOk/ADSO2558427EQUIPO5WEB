# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_28_234208) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "canchas", force: :cascade do |t|
    t.string "nombre"
    t.integer "jugadores"
    t.float "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "distancia"
    t.string "image"
  end

  create_table "clientes", force: :cascade do |t|
    t.integer "identificacion"
    t.string "nombre"
    t.string "apellido"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "usuario_id"
    t.index ["usuario_id"], name: "index_clientes_on_usuario_id"
  end

  create_table "comentarios", force: :cascade do |t|
    t.text "contenido"
    t.bigint "valoracion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["valoracion_id"], name: "index_comentarios_on_valoracion_id"
  end

  create_table "reservas", force: :cascade do |t|
    t.date "fecha"
    t.time "hora_inicio"
    t.time "hora_fin"
    t.bigint "cancha_id", null: false
    t.bigint "cliente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cancha_id"], name: "index_reservas_on_cancha_id"
    t.index ["cliente_id"], name: "index_reservas_on_cliente_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.integer "identificacion"
    t.string "nombre"
    t.string "apellido"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "valoraciones", force: :cascade do |t|
    t.integer "calificacion"
    t.text "comentario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clientes", "usuarios"
  add_foreign_key "comentarios", "valoraciones"
  add_foreign_key "reservas", "canchas"
  add_foreign_key "reservas", "clientes"
end
