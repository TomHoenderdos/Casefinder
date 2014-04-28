class SizesController < ApplicationController
  before_action :set_size, only: [:show, :edit, :update, :destroy]

  def index
	  @sizes = Size.rank(:row_order).to_a
  end

  def show
  end

  def new
  	user_signed_in?
  	@size = Size.new
  end

  def edit
  	user_signed_in?
  end

  def create
  	user_signed_in?
    @size = Size.new(size_params)
    if @size.save
        redirect_to action: "index"
    else
      render "new"
    end
  end

  def update
    user_signed_in?

      if @size.update(size_params)
        # Devicecase.where(:device_id => @device.id).delete_all
        # params[:device][:cases].each do |cases_id|
        #   devicecases = Devicecase.new(:device_id => @device.id, :case_id => cases_id)
        #   if devicecases.valid?
        #     devicecases.save
        #   else 
        #     p devicecases.errors
        #   end
        # end
        flash[:notice] = 'Size was successfully updated.'
        redirect_to action: "index"
      else
        render action: 'edit'
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_size
      @size = Size.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def size_params
      params.require(:size).permit(:size, :row_order)
    end

end
