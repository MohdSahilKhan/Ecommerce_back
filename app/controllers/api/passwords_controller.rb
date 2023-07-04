class Api::PasswordsController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def create
    user = User.find_by(email: params[:user][:email])
    if user.present?
      user.send_reset_password_instructions
      render json: { message: 'Reset password instructions sent' }
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  def update
    user = User.reset_password_by_token(resource_params)
    if user.errors.empty?
      render json: { message: 'Password updated successfully' }
    else
      render json: { error: user.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.require(:user).permit(:reset_password_token, :password, :password_confirmation)
  end
end
