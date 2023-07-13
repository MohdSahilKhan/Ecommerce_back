class LeavesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_leave, only: [:show, :update, :destroy]

  def index
    @leaves = Leave.all
    render json: @leaves
  end

  def show
    leaves = Leave.find(params[:id])
    render json: leaves
  end

  def create
    params[:leave][:user_id]=current_user.id
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
    render json: { message: 'Leave deleted successfully' }
  end

  def displayleaves
    binding.pry
    leavebalance = Leave.leavebalance(current_user.id)
    paidleaves = Leave.paidleaves(current_user.id)
    sickleaves = Leave.sickleaves(current_user.id)
    render json: { leavebalance: leavebalance, paidleaves: paidleaves, sickleaves: sickleaves }
  end

  private

  def set_leave
    @leave = Leave.find(params[:id])
  end

  def leave_params
    params.require(:leave).permit(:leave_type, :from_date, :to_date, :reason,:user_id,:apply_to, :from_time, :to_time, :consumed_leave)
  end

end
