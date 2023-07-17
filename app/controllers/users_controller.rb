class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

  def assign_managers
    user = User.find(params[:user_id])
    manager_ids = params[:manager_ids] || []
    managers = User.where(id: manager_ids)  
    user.managers << managers
    render json: { message: 'Managers assigned successfully' }
  end
  
end
