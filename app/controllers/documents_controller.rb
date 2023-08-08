class DocumentsController < ApplicationController
  skip_before_action :verify_authenticity_token 
  before_action :set_document, only: [:destroy]
 
  def index
    @documents = Document.all
    render json: @documents, status: :ok
  end

  def show
    @document = Document.find(params[:id])
    render json: @document, status: :ok
  end

  def create
    # params[:document][:user_id] = current_user.id    
    @document = Document.new(document_params)
    if @document.save
      render json: { document: @document, message: "Document created successfully" , "success": "true "} , status: :ok
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  def update
    # params[:document][:user_id] = current_user.id
    @document = Document.find(params[:id])

    if @document.update(document_params)
      render json: { document: @document, message: "Document updated successfully" , "success": "true "} , status: :created
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  def destroy
   
    if current_user.has_role?(:admin) || current_user.id == @document.user_id

      @document.destroy
      render json: { message: "Document successfully deleted" , "success": "true "}
    else
      render json: { error: "You are not authorized to delete this document" }, status: :unauthorized
    end
  end

  private

  def set_document
    @document = Document.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Document not found" }, status: :not_found
  end
  
  def document_params
    params.require(:document).permit(:resume ,:aadhar , :pan, :passport,:relieving_letter, :experience_letter,:bank_statement_3_mon, :basic_salary, :hra, :allowance_medical, :allowance_special, :incentives, :user_id) # Replace with actual attributes of the salary_infos table.
  end

end
