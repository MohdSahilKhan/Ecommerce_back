class DocumentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @documents = Document.all
    render json: @documents, status: :ok
  end

  def show
    @document = Document.find(params[:id])
    render json: @documents, status: :ok
  end

  def create
    params[:document][:user_id] = current_user.id    
    @document = Document.new(document_params)
    if @document.save
      render json: @document, status: :created
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  def update
    @document = Document.find(params[:id])

    if @document.update(document_params)
      render json: @document, status: :created
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  private

  def document_params
    params.require(:document).permit(:basic_salary, :hra, :allowance_medical, :allowance_special, :incentives, :user_id) # Replace with actual attributes of the salary_infos table.
  end

end
