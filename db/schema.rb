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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_14_091651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "answer_options", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "next_question_id"
    t.string "option_text"
    t.string "option_value"
    t.integer "order", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["next_question_id"], name: "index_answer_options_on_next_question_id"
    t.index ["order", "updated_at"], name: "index_answer_options_on_order_and_updated_at"
    t.index ["order"], name: "index_answer_options_on_order"
    t.index ["question_id"], name: "index_answer_options_on_question_id"
    t.index ["updated_at"], name: "index_answer_options_on_updated_at"
  end

  create_table "answers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_answers", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "answer_id"
    t.string "answer_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_question_answers_on_answer_id"
    t.index ["question_id"], name: "index_question_answers_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "survey_id"
    t.text "question_text"
    t.integer "order", default: 1
    t.integer "question_type", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order", "updated_at"], name: "index_questions_on_order_and_updated_at"
    t.index ["order"], name: "index_questions_on_order"
    t.index ["question_type"], name: "index_questions_on_question_type"
    t.index ["survey_id"], name: "index_questions_on_survey_id"
    t.index ["updated_at"], name: "index_questions_on_updated_at"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
