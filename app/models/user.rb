class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_and_belongs_to_many :managers,
  class_name: 'User',
  join_table: 'managers_users',
  foreign_key: 'user_id',
  association_foreign_key: 'manager_id' 

  # validates :employee_type, inclusion: { in: ['full time', 'contract'] }
  # validates :job_type, inclusion: { in: ['remote', 'wfo'] }

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:employee) unless self.has_any_role?
  end
  has_many :bank_details, dependent: :destroy
  has_one_attached :profile_picture
end
