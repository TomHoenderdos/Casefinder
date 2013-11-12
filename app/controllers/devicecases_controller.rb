class DevicecasesController < ApplicationController
  before_action :set_devicecase, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  # GET /devicecases
  # GET /devicecases.json
  def index
    @devicecases = Devicecase.all
  end

  # GET /devicecases/1
  # GET /devicecases/1.json
  def show
  end

  # GET /devicecases/new
  def new
    @devicecase = Devicecase.new
  end

  # GET /devicecases/1/edit
  def edit
  end

  # POST /devicecases
  # POST /devicecases.json
  def create
    @devicecase = Devicecase.new(devicecase_params)

    respond_to do |format|
      if @devicecase.save
        format.html { redirect_to @devicecase, notice: 'Devicecase was successfully created.' }
        format.json { render action: 'show', status: :created, location: @devicecase }
      else
        format.html { render action: 'new' }
        format.json { render json: @devicecase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devicecases/1
  # PATCH/PUT /devicecases/1.json
  def update
    respond_to do |format|
      if @devicecase.update(devicecase_params)
        format.html { redirect_to @devicecase, notice: 'Devicecase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @devicecase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devicecases/1
  # DELETE /devicecases/1.json
  def destroy
    @devicecase.destroy
    respond_to do |format|
      format.html { redirect_to devicecases_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_devicecase
      @devicecase = Devicecase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def devicecase_params
      params[:devicecase]
    end
end
