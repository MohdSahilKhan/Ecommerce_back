class StatusesController < ApplicationController
    before_action :set_status, only: [:show, :edit, :update, :destroy]

    def index
      binding.pry
    statuses = Status.includes(:tasks)
    render json: statuses, include: :tasks
      # render index view or return JSON response
    end
  
    def show
      status = Status.includes(:tasks).find(params[:id])
      render json: status, include: :tasks
    end
  
    def new
      @status = Status.new
      # render new view or return JSON response
    end
  
    def create
      @status = Status.new(status_params)
      
      if @status.save    
        render json: @status, status: :created
      else
        render json: @status.errors, status: :unprocessable_entity
      end
    end
  
    def edit
      # render edit view or return JSON response
    end
  
    def update
      if @status.update(status_params)
        # handle successful update (redirect or return JSON response)
      else
        # handle validation errors (render edit view or return JSON response with errors)
      end
    end
  
    def destroy
      status = Status.find(params[:id])
      status.tasks.destroy_all
      status.destroy
      render json: { message: 'Status and associated tasks deleted successfully' }
    end
  
    private
  
    def set_status
      @status = Status.find(params[:id])
    end
    
    def status_params
        params.require(:status).permit(:to, :cc, :status_date, tasks_attributes: [:working_hours, :task_status, :task_description, :billing_hours, :project_id])

    end

      
end
