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

ActiveRecord::Schema.define(version: 2023_07_25_071406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_details", force: :cascade do |t|
    t.string "account_name"
    t.string "account_number"
    t.string "ifsc"
    t.string "cancelled_cheque"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_bank_details_on_user_id"
  end

  create_table "deductions", force: :cascade do |t|
    t.decimal "pf", precision: 10, scale: 2
    t.decimal "esic", precision: 10, scale: 2
    t.decimal "tds", precision: 10, scale: 2
    t.decimal "professional_tax", precision: 10, scale: 2
    t.decimal "gratuity", precision: 10, scale: 2
    t.decimal "income_tax", precision: 10, scale: 2
    t.decimal "old_regime", precision: 10, scale: 2
    t.decimal "new_regime", precision: 10, scale: 2
    t.decimal "leave_deduction", precision: 10, scale: 2
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_deductions_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "resume"
    t.string "aadhar"
    t.string "pan"
    t.string "passport"
    t.string "relieving_letter"
    t.string "experience_letter"
    t.string "bank_statement_3_mon"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "leaves", force: :cascade do |t|
    t.integer "leave_balance", default: 40
    t.string "leave_type"
    t.date "from_date"
    t.date "to_date"
    t.string "leave_status", default: "pending"
    t.text "reason"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "apply_to"
    t.string "from_time"
    t.string "to_time"
    t.integer "consumed_leave"
    t.index ["user_id"], name: "index_leaves_on_user_id"
  end

  create_table "managers_users", id: false, force: :cascade do |t|
    t.bigint "manager_id"
    t.bigint "user_id"
    t.index ["manager_id", "user_id"], name: "index_managers_users_on_manager_id_and_user_id", unique: true
    t.index ["manager_id"], name: "index_managers_users_on_manager_id"
    t.index ["user_id"], name: "index_managers_users_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "domain"
    t.date "start_date"
    t.decimal "rate"
    t.string "currency"
    t.string "project_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "assigned_to"
    t.integer "assigned_by"
    t.integer "user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "salary_infos", force: :cascade do |t|
    t.decimal "basic_salary", precision: 10, scale: 2
    t.decimal "hra", precision: 10, scale: 2
    t.decimal "allowance_medical", precision: 10, scale: 2
    t.decimal "allowance_special", precision: 10, scale: 2
    t.decimal "incentives", precision: 10, scale: 2
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_salary_infos_on_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "to"
    t.string "cc"
    t.datetime "status_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.decimal "working_hours"
    t.string "task_status"
    t.bigint "project_id", null: false
    t.bigint "status_id", null: false
    t.text "task_description"
    t.decimal "billing_hours"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["status_id"], name: "index_tasks_on_status_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "login_token"
    t.integer "manager_id"
    t.string "full_name"
    t.string "father_name"
    t.string "mother_name"
    t.string "location"
    t.string "linkedin_profile"
    t.string "contact_no"
    t.string "personal_email"
    t.string "official_email"
    t.string "emergency_contact"
    t.string "blood_group"
    t.string "marital_status"
    t.datetime "date_of_birth"
    t.string "uan_no"
    t.string "esic_no"
    t.string "employee_id"
    t.string "employee_type"
    t.string "job_type"
    t.string "date_of_joining"
    t.string "relieving_date"
    t.string "resignation_date"
    t.string "resignation_status"
    t.string "notice_period"
    t.string "retention_bonus"
    t.string "retention_time"
    t.string "retention_bonus_no"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "bank_details", "users"
  add_foreign_key "deductions", "users"
  add_foreign_key "documents", "users"
  add_foreign_key "leaves", "users"
  add_foreign_key "salary_infos", "users"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "statuses"
end
