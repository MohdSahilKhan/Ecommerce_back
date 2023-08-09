class BankDetailsController < ApplicationController
  skip_before_action :verify_authenticity_token
    def show
      # binding.pry
      user_id = params[:id]
      bank_details = BankDetail.find_by(user_id: user_id)
      if bank_details.present?
        render json: { bank_details: bank_details}, status: :ok
      else
        render json: { error: 'Bank Detail not found' }, status: :not_found
      end
    end
  
    def create
      # binding.pry
      @user = current_user 
      bank_details = @user.bank_details.new(bank_params)
      if bank_details.save
        render json: { message: 'Bank Detils created successfully' }
      else
        render json: { error: bank_details.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  
    def update
      # binding.pry
      user_id = params[:id]
      bank_details = BankDetail.find_by(user_id: user_id)
    
      if bank_details
        if bank_details.update(bank_params)
          render json: bank_details
        else
          render json: bank_details.errors
        end
      else
        render json: { error: 'Bank Detail not found' }, status: :not_found
      end
    end
    
  
    def destroy
      # binding.pry
      user_id = params[:id]
      bank_details = BankDetail.find_by(user_id: user_id)
      if bank_details
        if bank_details.destroy
          render json: { message: 'Bank details deleted successfully' }, status: :ok
        end
      end
    end


    private
      def bank_params
        params.require(:bank_detail).permit(:account_name, :account_number, :ifsc, :cancelled_cheque)
      end
  end
