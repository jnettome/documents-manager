class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  before_action :restrict_access, only: [:edit, :update, :destroy, :new, :create]

  # GET /documents
  # GET /documents.json
  def index
    @documents = user_documents.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = user_documents.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = user_documents.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download_file
    @document = user_documents.find(params[:id])
    send_file(@document.file.path,
      :disposition => 'attachment',
      :url_based_filename => false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = user_documents.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:user_id, :file)
    end

    def user_documents
      if current_user.email == 'hi@joaonetto.me'
        Document
      else
        current_user.documents
      end
    end

    def restrict_access
      return if current_user.is_admin?
      flash[:error] = 'You don\'t have permission.'
      redirect_to documents_path
    end
end
