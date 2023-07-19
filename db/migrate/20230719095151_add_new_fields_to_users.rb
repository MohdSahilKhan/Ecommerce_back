class AddNewFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :father_name, :string
    add_column :users, :mother_name, :string
    add_column :users, :location, :string
    add_column :users, :linkedin_profile, :string
    add_column :users, :contact_no, :string
    add_column :users, :personal_email, :string
    add_column :users, :official_email, :string
    add_column :users, :emergency_contact, :string
    add_column :users, :blood_group, :string
    add_column :users, :marital_status, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :uan_no, :string
    add_column :users, :esic_no, :string
    add_column :users, :employee_id, :string
    add_column :users, :employee_type, :string
    add_column :users, :job_type, :string
    add_column :users, :date_of_joining, :string
    add_column :users, :relieving_date, :string
    add_column :users, :resignation_date, :string
    add_column :users, :resignation_status, :string
    add_column :users, :notice_period, :string
    add_column :users, :retention_bonus, :string
    add_column :users, :retention_time, :string
    add_column :users, :retention_bonus_no, :string
    add_column :users, :name, :string
  end
end
