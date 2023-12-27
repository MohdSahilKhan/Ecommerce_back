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

ActiveRecord::Schema.define(version: 2023_12_21_094414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bank_details", force: :cascade do |t|
    t.string "account_name"
    t.string "account_number"
    t.string "ifsc"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_bank_details_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "chat_name"
    t.boolean "is_group", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "chats_users", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_id"], name: "index_chats_users_on_chat_id"
    t.index ["user_id"], name: "index_chats_users_on_user_id"
  end

  create_table "check_in_outs", force: :cascade do |t|
    t.string "check_in"
    t.string "check_out"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "date"
    t.string "total_time"
    t.string "punch_type"
    t.string "remark"
    t.string "emp_code"
    t.index ["emp_code"], name: "index_check_in_outs_on_emp_code"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "street_address"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password"
    t.string "password_confirmation"
    t.string "client_type"
    t.string "city"
    t.string "time_zone"
    t.date "onboard_date"
    t.string "onboarded_by"
    t.string "document_url"
    t.string "goods_and_services_tax"
    t.decimal "tax_rate", precision: 5, scale: 2
    t.boolean "is_active", default: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "industry"
    t.string "website"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.boolean "email_feature"
    t.boolean "chat_feature"
    t.boolean "punching_feature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_details", force: :cascade do |t|
    t.string "phone"
    t.string "email"
    t.string "location"
    t.string "images_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "pin"
    t.date "incorporation_date"
    t.string "pan_number"
    t.string "gst_number"
    t.string "tan_number"
    t.bigint "company_profile_id"
    t.index ["company_profile_id"], name: "index_company_details_on_company_profile_id"
  end

  create_table "company_profiles", force: :cascade do |t|
    t.string "company_name"
    t.string "contact_number"
    t.text "emails", default: [], array: true
    t.json "social_links", default: []
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "newsletter_email"
  end

  create_table "company_taxes", force: :cascade do |t|
    t.string "name"
    t.string "tax_type"
    t.bigint "amount"
    t.date "due_date"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contact_us", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "subject"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "designations", force: :cascade do |t|
    t.string "designation"
    t.integer "position"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_designations_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "expense_for"
    t.string "expense_by"
    t.date "date"
    t.decimal "amount"
    t.string "payment_by"
    t.string "payment_method"
    t.string "invoice_image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text "comment"
    t.bigint "user_id"
    t.bigint "interview_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interview_id"], name: "index_feedbacks_on_interview_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "gadgets", force: :cascade do |t|
    t.string "gadget_name"
    t.string "assigned_to"
    t.string "assigned_by"
    t.date "assigned_date"
    t.string "serial_no"
    t.text "configuration"
    t.date "buying_date"
    t.decimal "buying_price"
    t.string "gadget_images"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "interviews", force: :cascade do |t|
    t.string "project_name"
    t.string "client_name"
    t.string "package_or_budget"
    t.string "website_link"
    t.string "project_provider_name"
    t.text "description"
    t.string "assignee_name"
    t.string "interview_rounds"
    t.datetime "date"
    t.datetime "from_time"
    t.datetime "to_time"
    t.string "meeting_link"
    t.integer "interview_status", default: 0
    t.bigint "admin_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_interviews_on_admin_id"
    t.index ["user_id"], name: "index_interviews_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "client_name"
    t.string "invoice_number"
    t.string "currency"
    t.float "amount"
    t.datetime "invoice_date"
    t.datetime "due_date"
    t.integer "status"
    t.bigint "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_invoices_on_client_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "state"
    t.string "country"
    t.string "phone_number"
    t.string "resume"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "job_opening_id", null: false
    t.index ["job_opening_id"], name: "index_job_applications_on_job_opening_id"
  end

  create_table "job_openings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "requirements"
    t.string "vacancy_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "job_type"
    t.string "status"
    t.string "location"
  end

  create_table "leave_types", force: :cascade do |t|
    t.string "leave_name"
    t.integer "no_of_leaves"
    t.string "credit_time_period"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "leaves", force: :cascade do |t|
    t.decimal "leave_balance", precision: 10, scale: 2, default: "1.5"
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
    t.decimal "consumed_leave", precision: 10, scale: 2
    t.string "employee_name"
    t.decimal "remaining_paid_leave", precision: 8, scale: 2, default: "1.0"
    t.decimal "remaining_sick_leave", precision: 8, scale: 2, default: "0.5"
    t.bigint "leave_type_id"
    t.text "remaining_leave"
    t.index ["leave_type_id"], name: "index_leaves_on_leave_type_id"
    t.index ["user_id"], name: "index_leaves_on_user_id"
  end

  create_table "managers_users", id: false, force: :cascade do |t|
    t.bigint "manager_id"
    t.bigint "user_id"
    t.index ["manager_id", "user_id"], name: "index_managers_users_on_manager_id_and_user_id", unique: true
    t.index ["manager_id"], name: "index_managers_users_on_manager_id"
    t.index ["user_id"], name: "index_managers_users_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "chat_id", null: false
    t.bigint "sender_id"
    t.string "sender_name"
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.text "message"
    t.string "user_type", null: false
    t.bigint "user_id", null: false
    t.boolean "is_read", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_type", "user_id"], name: "index_notifications_on_user"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "domain"
    t.string "start_date"
    t.string "rate"
    t.string "currency"
    t.string "project_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "assigned_to"
    t.integer "assigned_by"
    t.string "billable"
    t.bigint "user_id"
    t.string "status", default: "ongoing"
    t.date "end_date"
    t.string "billing_type"
    t.integer "client_id"
    t.bigint "amount"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "provident_funds", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "month"
    t.float "employee_share"
    t.float "employer_share"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_provident_funds_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "review"
    t.integer "rating"
    t.bigint "project_id"
    t.bigint "user_id"
    t.bigint "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_reviews_on_client_id"
    t.index ["project_id"], name: "index_reviews_on_project_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
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
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "gratuity"
    t.string "income_tax", default: "New Regime"
    t.decimal "pf", precision: 10, scale: 2
    t.decimal "esic", precision: 10, scale: 2
    t.decimal "tds", precision: 10, scale: 2
    t.decimal "professional_tax", precision: 10, scale: 2
    t.string "salary_type"
    t.decimal "incentives", precision: 10, scale: 2
    t.decimal "bonus_1", precision: 10, scale: 2
    t.decimal "bonus_2", precision: 10, scale: 2
    t.string "bonus_type_1"
    t.string "bonus_type_2"
    t.string "status"
    t.decimal "consultancy_fees", precision: 10, scale: 2
    t.string "period"
    t.index ["user_id"], name: "index_salary_infos_on_user_id"
  end

  create_table "salary_slips", force: :cascade do |t|
    t.decimal "basic_salary", precision: 10, scale: 2
    t.decimal "allowance_medical", precision: 10, scale: 2
    t.decimal "hra", precision: 10, scale: 2
    t.decimal "gratuity", precision: 10, scale: 2
    t.decimal "allowance_special", precision: 10, scale: 2
    t.string "income_tax", default: "New Regime"
    t.decimal "pf", precision: 10, scale: 2
    t.decimal "esic", precision: 10, scale: 2
    t.decimal "tds", precision: 10, scale: 2
    t.decimal "professional_tax", precision: 10, scale: 2
    t.decimal "incentives", precision: 10, scale: 2
    t.string "salary_type", default: "full & final payment"
    t.string "bonus_type_1", default: "yearly"
    t.decimal "bonus_1", precision: 10, scale: 2
    t.string "bonus_type_2", default: "yearly"
    t.decimal "bonus_2", precision: 10, scale: 2
    t.string "status", default: "done"
    t.decimal "consultancy_fees", precision: 10, scale: 2
    t.string "period", default: "yearly"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "invoice"
    t.bigint "gst"
    t.index ["user_id"], name: "index_salary_slips_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "title"
    t.string "icon_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.string "images_url"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "to"
    t.string "cc"
    t.datetime "status_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_statuses_on_user_id"
  end

  create_table "subscribes", force: :cascade do |t|
    t.string "email"
    t.boolean "is_active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.decimal "working_hours"
    t.string "task_status"
    t.bigint "project_id"
    t.bigint "status_id", null: false
    t.text "task_description"
    t.decimal "billing_hours"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "task_images_url"
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["status_id"], name: "index_tasks_on_status_id"
  end

  create_table "tds", force: :cascade do |t|
    t.string "pan"
    t.decimal "total_ammount"
    t.decimal "tds_ammount"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["user_id"], name: "index_tds_on_user_id"
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
    t.string "linkedin_profile"
    t.string "contact_no"
    t.string "personal_email"
    t.string "blood_group"
    t.string "marital_status"
    t.date "date_of_birth"
    t.string "uan_no"
    t.string "esic_no"
    t.string "employee_id"
    t.string "employee_type", default: "full time"
    t.string "job_type"
    t.string "date_of_joining"
    t.string "relieving_date"
    t.string "resignation_date"
    t.string "resignation_status"
    t.string "notice_period"
    t.string "retention_bonus"
    t.string "retention_time"
    t.string "retention_bonus_no"
    t.string "gender"
    t.string "city"
    t.string "pincode"
    t.string "state"
    t.string "address"
    t.string "designation"
    t.string "emergency_contact_no"
    t.string "emp_code"
    t.boolean "is_active", default: true
    t.string "profile_picture_url"
    t.string "section_applicable", default: "section 192", null: false
    t.string "country"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bank_details", "users"
  add_foreign_key "chats", "users"
  add_foreign_key "chats_users", "chats"
  add_foreign_key "chats_users", "users"
  add_foreign_key "company_details", "company_profiles"
  add_foreign_key "deductions", "users"
  add_foreign_key "documents", "users"
  add_foreign_key "job_applications", "job_openings"
  add_foreign_key "leaves", "leave_types"
  add_foreign_key "leaves", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "projects", "users"
  add_foreign_key "provident_funds", "users"
  add_foreign_key "salary_infos", "users"
  add_foreign_key "salary_slips", "users"
  add_foreign_key "statuses", "users"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "statuses"
  add_foreign_key "tds", "users"
end
