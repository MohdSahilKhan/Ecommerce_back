
require 'jwt'

class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # before_action :authenticate_user!, except: [:new, :create]
  skip_before_action :verify_authenticity_token, only: :create
  private

  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    if token.nil?
      render json: { error: 'Unauthorized' }, status: :unauthorized
    else
      payload = verify_token(token)
      if payload.nil?
        render json: { error: 'Invalid token' }, status: :unauthorized
      else
        expiration_time = Time.at(payload['exp'])
        if expiration_time < Time.now
          render json: { error: 'Token has expired' }, status: :unauthorized
        else
          user = User.find_by(id: payload['user_id'])
          if user.nil? || user.login_token != token
            render json: { error: 'Invalid token' }, status: :unauthorized
          else
            sign_in user, store: false
          end
        end
      end
    end
  end

  def verify_token(token)
    secret_key = Rails.application.secrets.secret_key_base
    JWT.decode(token, secret_key, true, algorithm: 'HS256').first
  rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
    nil
  end
end
