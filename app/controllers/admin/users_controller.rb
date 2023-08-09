module Admin
  class UsersController < Admin::ApplicationController
    
    def resource_params
      params.require(resource_name).permit(
        :blood_group,
        :contact_no,
        :date_of_birth,
        :date_of_joining,
        :email,
        :employee_id,
        :employee_type,
        :password,
        :esic_no,
        :father_name,
        :full_name,
        :job_type,
        :linkedin_profile,
        :gender,
        :city,
        :state,
        :pincode,
        :address,
        :login_token,
        :manager_id,
        :managers,
        :marital_status,
        :mother_name,
        :name,
        :notice_period,
        :personal_email,
        :relieving_date,
        :remember_created_at,
        :reset_password_sent_at,
        :reset_password_token,
        :resignation_date,
        :resignation_status,
        :retention_bonus,
        :retention_bonus_no,
        :retention_time,
        :uan_no,
        :designation,
        :emergency_contact_no,
        role_ids: [] 
      )
    end
  end
end
