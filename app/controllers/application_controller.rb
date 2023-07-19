class ApplicationController < ActionController::Base
  #before_action :authenticate_user!

  private

  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    user = User.find_by(login_token: token)

    if user.present? && user.login_token.present?
      sign_in user, store: false
    else
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end
