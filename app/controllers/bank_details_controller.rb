class BankDetailsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # skip_before_action :authenticate_user!
  # before_action :set_status, 
    def index
      @bank_details = BankDetail.all
    end
  
    def show

      @bank_details = BankDetail.find(params[:id])
    end
  
    def new
      @bank_details = BankDetail.new
    end
  
    def create
      # binding.pry
      # @user = User.find(params[:id])
      params[:user_id] = current_user.id
      @user = User.find(params[:user_id])
      bank_details = @user.bank_details.new(bank_params)
      if bank_details.save
        render json: { message: 'Bank Detils created successfully' }
      else
        render json: { error: bank_details.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  
    def edit
      @bank_details = BankDetail.find(params[:id])
    end
  
    def update
      @bank_details = BankDetail.find(params[:id])
  
      if @bank_details.update(bank_params)
        # redirect_to @bank_details
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @bank_details = BankDetail.find(params[:id])
      @bank_details.destroy
  
    #   redirect_to root_path, status: :see_other
    end
  
    private
      def bank_params
        params.require(:bank_details).permit(:account_name, :account_number, :ifsc, :cancelled_cheque)
      end
  end
  












