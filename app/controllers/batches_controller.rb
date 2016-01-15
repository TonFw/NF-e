class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :edit, :update, :destroy]

  # GET /batches
  # GET /batches.json
  def index
    @batches = Batch.all
  end

  # # GET /batches/1
  # # GET /batches/1.json
  # def show
  # end

  # GET /batches/new
  def new
    @batch = Batch.new
  end

  # # GET /batches/1/edit
  # def edit
  # end
  #
  # POST /batches
  # POST /batches.json
  def create
    @batch = Batch.new(batch_params)

    respond_to do |format|
      if @batch.save
        format.html { redirect_to @batch, notice: 'Batch was successfully created.' }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render :new }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1
  # DELETE /batches/1.json
  def destroy
    @batch.destroy
    respond_to do |format|
      format.html { redirect_to batches_url, notice: 'Batch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /batches/1/process
  def process_nfe
    @batch.process_it
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = Batch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_params
      params.require(:batch).permit(:attached)
    end
end