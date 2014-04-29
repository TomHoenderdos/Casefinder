class CasesController < ApplicationController
  before_action :set_case, only: [:show, :edit, :update, :destroy]

  # GET /cases
  # GET /cases.json
  def index
    @cases = Case.all
    # @devices = Device.all
  end

  # GET /cases/1
  # GET /cases/1.json
  def show
    if !user_signed_in?
      flash[:alert] = "You need to sign in before continuing."
      redirect_to action: "index"
    end
  end

  # GET /cases/new
  def new
    if !user_signed_in?
      flash[:alert] = "You need to sign in before continuing."
      redirect_to action: "index"
    end
    @case = Case.new
    @case.devices.build
  end

  # GET /cases/1/edit
  def edit
    if !user_signed_in?
      flash[:alert] = "You need to sign in before continuing."
      redirect_to action: "index"
    end
  end

  # POST /cases
  # POST /cases.json
  def create
    if !user_signed_in?
      flash[:alert] = "You need to sign in before continuing."
      redirect_to action: "index"
    end
    @case = Case.new(case_params)
      if params[:case][:devices] != [""]
        if @case.save    
          params[:case][:finishings].each do |finishing|
            finishingcase = Finishingcase.new(:finishing_id => finishing, :case_id => @case.id)
            if finishingcase.valid?
              finishingcase.save
            else 
              p finishingcase.errors
            end
          end

          params[:case][:devices].each do |devices|
            devicecases = Devicecase.new(:device_id => devices, :case_id => @case.id)
            if devicecases.valid?
              devicecases.save
            else 
              p devicecases.errors
            end
          end

          params[:case][:sizes].each do |sizes|
            sizecases = Sizecase.new(:size_id => sizes, :case_id => @case.id)
            if sizecases.valid?
              sizecases.save
            else
              p sizecases.errors
            end    
          end
          redirect_to action: "index"

        else
          render "new"
        end
      else
        flash[:notice] = "Add a <a class=\"alert-link\" href=\"/device\">device</a> first".html_safe
        redirect_to action: "index"
    end     
  end

  # PATCH/PUT /cases/1
  # PATCH/PUT /cases/1.json
  def update
    if !user_signed_in?
      flash[:alert] = "You need to sign in before continuing."
      redirect_to action: "index"
    end
      if @case.update(case_params)
        Devicecase.where(:case_id => @case.id).delete_all
        Finishingcase.where(:case_id => @case.id).delete_all
        Sizecase.where(:case_id => @case.id).delete_all
        params[:case][:finishings].each do |finishing|
          finishingcase = Finishingcase.new(:finishing_id => finishing, :case_id => @case.id)
          if finishingcase.valid?
            finishingcase.save
          else 
            p finishingcase.errors
          end
        end

        params[:case][:devices].each do |devices|
          devicecases = Devicecase.new(:device_id => devices, :case_id => @case.id)
          if devicecases.valid?
            devicecases.save
          else 
            p devicecases.errors
          end
        end

        params[:case][:sizes].each do |sizes|
          sizecases = Sizecase.new(:size_id => sizes, :case_id => @case.id)
          if sizecases.valid?
            sizecases.save
          else
            p sizecases.errors
          end    
        end
        flash[:notice] = 'Case was successfully updated.'
        redirect_to action: "index"
      else
        render action: "edit"
      end 
  end

  # DELETE /cases/1
  # DELETE /cases/1.json
  def destroy
    if !user_signed_in?
      flash[:alert] = "You need to sign in before continuing."
      redirect_to action: "index"
    else
      @case.destroy
      Devicecase.where(:case_id => @case.id).delete_all
      respond_to do |format|
        format.html { redirect_to cases_url }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case
      @case = Case.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_params
      params.require(:case).permit(:name, :description, :color, :product_type, :material, :finishing, :size, :picture, :devices, :finishings, :sizes, :url)
    end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = 'I cannot find the case you were looking for'
    redirect_to :action => :index
  end
end
