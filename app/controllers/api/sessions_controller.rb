class Api::SessionsController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def create
    user = User.find_for_authentication(email: params[:user][:email])
    if user.is_active == false
      render json: {message: "unable to login, you are disabled by admin "}, status: 401
      return
    end
    if user && user.valid_password?(params[:user][:password])
      role = params[:user][:role]
      roles = user.roles.map(&:name)
      if roles.include?(role)
        user.regenerate_login_token
        sign_in(user)
        render json: { id: user.id, full_name: user.full_name, token: user.login_token, success: true, emp_code: user.emp_code,  roles: role, profile_picture: user.profile_picture_url  }, status: :ok
      else
        render json: { error: "invalid role" }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Invalid email or password', success: false }, status: :unauthorized
    end
  end
  def destroy
    sign_out(current_user)
    render json: { message: 'Logged out successfully' }
  end
end
