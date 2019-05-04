class InvigilatorsController < ApplicationController
  before_action :set_invigilator, only: [:show, :edit, :update, :destroy]

  # GET /invigilators
  # GET /invigilators.json
  def index
    @invigilators = Invigilator.all
  end

  # GET /invigilators/1
  # GET /invigilators/1.json
  def show
  end

  # GET /invigilators/new
  def new
    @invigilator = Invigilator.new
  end

  # GET /invigilators/1/edit
  def edit
  end

  # POST /invigilators
  # POST /invigilators.json
  def create
    @invigilator = Invigilator.new(invigilator_params)

    respond_to do |format|
      if @invigilator.save
        format.html { redirect_to root_path, notice: 'Invigilator was successfully created.' }
        format.json { render :show, status: :created, location: @invigilator }
      else
        format.html { render :new }
        format.json { render json: @invigilator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invigilators/1
  # PATCH/PUT /invigilators/1.json
  def update
    respond_to do |format|
      if @invigilator.update(invigilator_params)
        format.html { redirect_to @invigilator, notice: 'Invigilator was successfully updated.' }
        format.json { render :show, status: :ok, location: @invigilator }
      else
        format.html { render :edit }
        format.json { render json: @invigilator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invigilators/1
  # DELETE /invigilators/1.json
  def destroy
    @invigilator.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Invigilator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invigilator
      @invigilator = Invigilator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invigilator_params
      params.require(:invigilator).permit(:name, :invigilator_type)
    end
end
