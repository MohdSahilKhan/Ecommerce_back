class BankDetailsController < ApplicationController
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
      @bank_details = BankDetail.new(bank_params)
  
      if @bank_details.save
        redirect_to @article
      else
        render :new, status: :unprocessable_entity
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
        params.require(:article).permit(:account_name, :account_number, :ifsc, :cancelled_cheque, :user_id)
      end
  end
  