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

ActiveRecord::Schema.define(version: 20180329113759) do

  create_table "grades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "grade"
    t.string "info"
    t.date "obtained_date"
    t.bigint "subject_id"
    t.bigint "student_id"
    t.bigint "user_id"
    t.index ["student_id"], name: "index_grades_on_student_id"
    t.index ["subject_id"], name: "index_grades_on_subject_id"
    t.index ["user_id"], name: "index_grades_on_user_id"
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "groupName"
  end

  create_table "note_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "note_type"
  end

  create_table "notes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "description"
    t.bigint "user_id"
    t.bigint "student_id"
    t.bigint "note_type_id"
    t.date "obtained_date"
    t.index ["note_type_id"], name: "index_notes_on_note_type_id"
    t.index ["student_id"], name: "index_notes_on_student_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.index ["group_id"], name: "index_students_on_group_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "subjectName"
  end

  create_table "teacher_group_subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.bigint "subject_id"
    t.index ["group_id"], name: "index_teacher_group_subjects_on_group_id"
    t.index ["subject_id"], name: "index_teacher_group_subjects_on_subject_id"
    t.index ["user_id"], name: "index_teacher_group_subjects_on_user_id"
  end

  create_table "user_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "userType"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "phone"
    t.string "email"
    t.string "login"
    t.string "password_digest"
    t.string "address"
    t.date "birth_date"
    t.bigint "user_type_id"
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  add_foreign_key "grades", "students"
  add_foreign_key "grades", "subjects"
  add_foreign_key "grades", "users"
  add_foreign_key "notes", "note_types"
  add_foreign_key "notes", "students"
  add_foreign_key "notes", "users"
  add_foreign_key "students", "groups"
  add_foreign_key "students", "users"
  add_foreign_key "teacher_group_subjects", "groups"
  add_foreign_key "teacher_group_subjects", "subjects"
  add_foreign_key "teacher_group_subjects", "users"
  add_foreign_key "users", "user_types"
end
