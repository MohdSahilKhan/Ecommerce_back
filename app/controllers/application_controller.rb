class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def authenticate_user!
    binding.pry
    token = request.headers['Authorization']&.split(' ')&.last
    user = User.find_by(login_token: token)

    if user
      sign_in user, store: false
    else
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end
