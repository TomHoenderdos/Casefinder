class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
    
  end

  # GET /devices/new
  def new
    user_signed_in?
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
    user_signed_in?
  end

  # POST /devices
  # POST /devices.json
  def create
    user_signed_in?
      @device = Device.new(device_params)
      if @device.save
          redirect_to action: "index"
      else
        render "new"
      end
  end
 
  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    user_signed_in?
      if @device.update(device_params)
        Devicecase.where(:device_id => @device.id).delete_all
        params[:device][:cases].each do |cases_id|
          devicecases = Devicecase.new(:device_id => @device.id, :case_id => cases_id)
          if devicecases.valid?
            devicecases.save
          else 
            p devicecases.errors
          end
        end
        flash[:notice] = 'Device was successfully updated.'
        redirect_to action: "index"
      else
        render action: 'edit'
      end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    user_signed_in?
    @device.destroy
    Devicecase.where(:device_id => @device.id).delete_all
    respond_to do |format|
      format.html { redirect_to devices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:full_name, :brand)
    end
end
