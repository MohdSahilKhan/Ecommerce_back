class Api::RegistrationsController < ActionController::Base
  skip_before_action :verify_authenticity_token

    def create
      user = User.new(sign_up_params)
      if user.save
        render json: { message: 'User created successfully' }
      else
        render json: { error: user.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  
    private
  
    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
