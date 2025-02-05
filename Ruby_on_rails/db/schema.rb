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

ActiveRecord::Schema[8.0].define(version: 2025_02_04_232007) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "coordenadors", force: :cascade do |t|
    t.integer "departamento_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departamento_id"], name: "index_coordenadors_on_departamento_id"
    t.index ["user_id"], name: "index_coordenadors_on_user_id"
  end

  create_table "departamentos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materia", force: :cascade do |t|
    t.string "nome"
    t.string "codigo"
    t.integer "departamento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departamento_id"], name: "index_materia_on_departamento_id"
  end

  create_table "matriculas", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "turma_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["turma_id"], name: "index_matriculas_on_turma_id"
    t.index ["user_id"], name: "index_matriculas_on_user_id"
  end

  create_table "questao_options", force: :cascade do |t|
    t.string "nome"
    t.text "texto"
    t.integer "questao_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questao_id"], name: "index_questao_options_on_questao_id"
  end

  create_table "questaos", force: :cascade do |t|
    t.string "nome"
    t.text "texto"
    t.string "tipo"
    t.integer "template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_questaos_on_template_id"
  end

  create_table "questionarios", force: :cascade do |t|
    t.string "nome"
    t.integer "turma_id", null: false
    t.integer "template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["template_id"], name: "index_questionarios_on_template_id"
    t.index ["turma_id"], name: "index_questionarios_on_turma_id"
    t.index ["user_id"], name: "index_questionarios_on_user_id"
  end

  create_table "respondidos", force: :cascade do |t|
    t.integer "questionario_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionario_id"], name: "index_respondidos_on_questionario_id"
    t.index ["user_id"], name: "index_respondidos_on_user_id"
  end

  create_table "resposta", force: :cascade do |t|
    t.string "valor"
    t.integer "questao_id", null: false
    t.integer "questionario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questao_id"], name: "index_resposta_on_questao_id"
    t.index ["questionario_id"], name: "index_resposta_on_questionario_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "nome"
    t.string "publico_alvo"
    t.string "semestre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turmas", force: :cascade do |t|
    t.string "codigo"
    t.string "semestre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "materium_id", null: false
    t.index ["materium_id"], name: "index_turmas_on_materium_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "matricula"
    t.string "email"
    t.string "nome"
    t.string "role"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "coordenadors", "departamentos"
  add_foreign_key "coordenadors", "users"
  add_foreign_key "materia", "departamentos"
  add_foreign_key "matriculas", "turmas"
  add_foreign_key "matriculas", "users"
  add_foreign_key "questao_options", "questaos"
  add_foreign_key "questaos", "templates"
  add_foreign_key "questionarios", "templates"
  add_foreign_key "questionarios", "turmas"
  add_foreign_key "questionarios", "users"
  add_foreign_key "respondidos", "questionarios"
  add_foreign_key "respondidos", "users"
  add_foreign_key "resposta", "questaos"
  add_foreign_key "resposta", "questionarios"
  add_foreign_key "turmas", "materia"
end
