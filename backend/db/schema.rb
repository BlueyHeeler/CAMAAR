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

ActiveRecord::Schema[7.0].define(version: 2022_04_19_233227) do
  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.integer "survey_answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_answer_id"], name: "index_answers_on_survey_answer_id"
  end

  create_table "cclasses", force: :cascade do |t|
    t.string "code"
    t.string "semester"
    t.string "time"
    t.integer "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_cclasses_on_subject_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "cclass_id", null: false
    t.integer "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cclass_id"], name: "index_enrollments_on_cclass_id"
    t.index ["member_id"], name: "index_enrollments_on_member_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "likert_questions", force: :cascade do |t|
    t.text "question"
    t.integer "likert_scale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["likert_scale_id"], name: "index_likert_questions_on_likert_scale_id"
  end

  create_table "likert_scales", force: :cascade do |t|
    t.integer "survey_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_question_id"], name: "index_likert_scales_on_survey_question_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name", null: false
    t.string "registration", null: false
    t.string "username", null: false
    t.string "occupation", null: false
    t.string "degree", null: false
    t.string "course", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registration"], name: "index_members_on_registration", unique: true
  end

  create_table "multiple_choices", force: :cascade do |t|
    t.integer "survey_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_question_id"], name: "index_multiple_choices_on_survey_question_id"
  end

  create_table "options", force: :cascade do |t|
    t.text "option"
    t.integer "multiple_choice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["multiple_choice_id"], name: "index_options_on_multiple_choice_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_subjects_on_code", unique: true
    t.index ["name"], name: "index_subjects_on_name", unique: true
  end

  create_table "survey_answers", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_survey_answers_on_member_id"
    t.index ["survey_id"], name: "index_survey_answers_on_survey_id"
  end

  create_table "survey_questions", force: :cascade do |t|
    t.string "type"
    t.text "question"
    t.boolean "optional"
    t.integer "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_survey_questions_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["member_id"], name: "index_users_on_member_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "survey_answers"
  add_foreign_key "cclasses", "subjects"
  add_foreign_key "enrollments", "cclasses"
  add_foreign_key "enrollments", "members"
  add_foreign_key "likert_questions", "likert_scales"
  add_foreign_key "likert_scales", "survey_questions"
  add_foreign_key "multiple_choices", "survey_questions"
  add_foreign_key "options", "multiple_choices"
  add_foreign_key "survey_answers", "members"
  add_foreign_key "survey_answers", "surveys"
  add_foreign_key "survey_questions", "surveys"
  add_foreign_key "users", "members"
end
