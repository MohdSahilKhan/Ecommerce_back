class Api::SessionsController < ActionController::Base
  skip_before_action :verify_authenticity_token
  
  def create
    user = User.find_for_authentication(email: params[:user][:email])
    if user && user.valid_password?(params[:user][:password])
      # Generate Token and save that token in user table.
      user.authentication_token = Devise.friendly_token
      user.save      
      sign_in(user)
      render json: { token: user.authentication_token }  # Make sure this line is present
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    sign_out(current_user)    
    render json: { message: 'Logged out successfully' }
  end 
end
