class Api::SessionsController < ActionController::Base
  skip_before_action :verify_authenticity_token
  
  def create
    user = User.find_for_authentication(email: params[:user][:email])
    if user && user.valid_password?(params[:user][:password])
      # Generate Token and save that token in user table.
      user.update!(login_token: Devise.friendly_token)
      sign_in(user)
      render json: { token: user.login_token , "success":"true" }, status: :ok # Make sure this line is present
    else
      render json: { error: 'Invalid email or password', "success":"false"}, status: :unauthorized
    end
  end

  def destroy
    sign_out(current_user)    
    render json: { message: 'Logged out successfully' }
  end 
end
