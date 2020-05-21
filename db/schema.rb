# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_12_11_234050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer "subject_id"
    t.string "assignment_type"
    t.string "name"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.integer "citizenship_grade"
  end

  create_table "students_assignments", force: :cascade do |t|
    t.integer "student_id"
    t.integer "assignment_id"
    t.integer "grade"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students_subjects", id: false, force: :cascade do |t|
    t.bigint "subject_id", null: false
    t.bigint "student_id", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hw_weight"
    t.integer "quiz_weight"
    t.integer "test_weight"
    t.integer "project_weight"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "admin"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "uid"
    t.string "image"
  end

end
