class ManagersController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /managers or /managers.json
  def index
    @managers =  User.find(current_user.id).managers.pluck(:id,:email)
    render json: @managers
  end

end
