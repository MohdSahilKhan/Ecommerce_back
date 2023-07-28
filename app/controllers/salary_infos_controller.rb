class SalaryInfosController < ApplicationController
skip_before_action :verify_authenticity_token

  def index
    @salary_infos = SalaryInfo.all
    render json: @salary_infos, status: :ok
  end

  def show
    @salary_info = SalaryInfo.find(params[:id])
    render json: @salary_info, status: :ok
  end

  def create
    params[:salary_info][:user_id] = current_user.id    
    @salary_info = SalaryInfo.new(salary_info_params)
    if @salary_info.save
      render json: @salary_info, status: :created
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  def update
    @salary_info = SalaryInfo.find(params[:id])

    if @salary_info.update(salary_info_params)
      render json: @salary_info, status: :created
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  private

  def salary_info_params
    params.require(:salary_info).permit(:basic_salary, :hra, :allowance_medical, :allowance_special, :incentives, :user_id) # Replace with actual attributes of the salary_infos table.
  end

end
