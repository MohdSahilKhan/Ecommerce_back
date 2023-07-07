class LeavesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_leave, only: [:show, :update, :destroy]

  def index
    binding.pry
    @leaves = Leave.all
    render json: @leaves
  end

  def show
    render json: @leave
  end

  def create
    @leave = Leave.new(leave_params)
    if @leave.save
      render json: @leave, status: :created
    else
      render json: @leave.errors, status: :unprocessable_entity
    end
  end

  def update
    if @leave.update(leave_params)
      render json: @leave
    else
      render json: @leave.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @leave.destroy
    head :no_content
  end

  private

  def set_leave
    @leave = Leave.find(params[:id])
  end

  def leave_params
    params.require(:leave).permit(:leave_balance, :leave_type, :from_date, :to_date, :leave_status, :reason, :user_id)
  end
end
