require 'jwt'
class Api::SessionsController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_for_authentication(email: params[:user][:email])
    roles = user.roles.map(&:name)

    if user && user.valid_password?(params[:user][:password])
      role = params[:user][:role]
      if roles.include?(role)
        user.update!(login_token: generate_login_token(user))
        sign_in(user)
        render json: { token: user.login_token, "success": "true", "roles": role }, status: :ok
      else
        render json: { error: "invalid role" }
      end
    else
      render json: { error: 'Invalid email or password', "success": "false" }, status: :unauthorized
    end
  end

  def destroy
    sign_out(current_user)
    render json: { message: 'Logged out successfully' }
  end

  private

  def generate_login_token(user)
    expiration_time = Time.now + 24.hours
    payload = { user_id: user.id, exp: expiration_time.to_i }
    secret_key = Rails.application.secrets.secret_key_base
    JWT.encode(payload, secret_key, 'HS256')
  end
end
