class FinishingsController < ApplicationController
  before_action :set_finishing, only: [:show, :edit, :update, :destroy]

  # GET /finishings
  # GET /finishings.json
  def index
    @finishings = Finishing.all
  end

  # GET /finishings/1
  # GET /finishings/1.json
  def show
  end

  # GET /finishings/new
  def new
    @finishing = Finishing.new
  end

  # GET /finishings/1/edit
  def edit
  end

  # POST /finishings
  # POST /finishings.json
  def create
    @finishing = Finishing.new(finishing_params)

    respond_to do |format|
      if @finishing.save
        format.html { redirect_to @finishing, notice: 'Finishing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @finishing }
      else
        format.html { render action: 'new' }
        format.json { render json: @finishing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /finishings/1
  # PATCH/PUT /finishings/1.json
  def update
    respond_to do |format|
      if @finishing.update(finishing_params)
        format.html { redirect_to @finishing, notice: 'Finishing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @finishing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finishings/1
  # DELETE /finishings/1.json
  def destroy
    @finishing.destroy
    respond_to do |format|
      format.html { redirect_to finishings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_finishing
      @finishing = Finishing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def finishing_params
      params.require(:finishing).permit(:name, :search_string)
    end
end
