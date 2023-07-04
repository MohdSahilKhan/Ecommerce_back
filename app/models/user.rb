class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :authentication_token
  
  User.find_each do |user|
    user.authentication_token = Devise.friendly_token
    user.save!
  end       
end
