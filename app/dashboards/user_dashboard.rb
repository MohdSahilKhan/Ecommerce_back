require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    blood_group: Field::String,
    contact_no: Field::String,
    date_of_birth: Field::Date,
    date_of_joining: Field::String,
    email: Field::String,
    password: Field::String,
    employee_id: Field::String,
    employee_type: Field::String,
    encrypted_password: Field::String,
    esic_no: Field::String,
    father_name: Field::String,
    full_name: Field::String,
    job_type: Field::String,
    linkedin_profile: Field::String,
    login_token: Field::String,
    manager_id: Field::Number,
    managers: Field::HasMany,
    marital_status: Field::String,
    mother_name: Field::String,
    name: Field::String,
    notice_period: Field::String,
    personal_email: Field::String,
    relieving_date: Field::String,
    remember_created_at: Field::DateTime,
    reset_password_sent_at: Field::DateTime,
    reset_password_token: Field::String,
    resignation_date: Field::String,
    resignation_status: Field::String,
    retention_bonus: Field::String,
    retention_bonus_no: Field::String,
    retention_time: Field::String,
    roles: Field::HasMany.with_options(class_name: "Role"),
    uan_no: Field::String,
    gender: Field::String,
    city: Field::String,
    state: Field::String,
    pincode: Field::String,
    address: Field::String,
    designation: Feild::String,
    emergency_contact_no: Feild::String
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    full_name
    contact_no
    email
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    blood_group
    contact_no
    date_of_birth
    date_of_joining
    email
    gender 
    city
    state
    pincode
    address
    employee_id
    employee_type
    esic_no
    father_name
    full_name
    job_type
    linkedin_profile
    manager_id
    managers
    marital_status
    mother_name
    name
    notice_period
    personal_email
    relieving_date
    resignation_date
    resignation_status
    retention_bonus
    retention_bonus_no
    retention_time
    uan_no
    roles
    designation
    emergency_contact_no
  ].freeze

  FORM_ATTRIBUTES = %i[
    blood_group
    contact_no
    date_of_birth
    date_of_joining
    email
    password
    employee_id
    employee_type
    esic_no
    father_name
    full_name
    job_type
    linkedin_profile
    manager_id
    managers
    marital_status
    mother_name
    gender
    city
    state
    pincode
    address
    name
    notice_period
    official_email
    personal_email
    relieving_date
    resignation_date
    resignation_status
    retention_bonus
    retention_bonus_no
    retention_time
    roles
    uan_no
    designation
    emergency_contact_no
  ].freeze

  COLLECTION_FILTERS = {}.freeze

end


