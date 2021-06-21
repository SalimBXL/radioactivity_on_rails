class ProductionsController < ApplicationController
  before_action :set_production, only: %i[ show edit update destroy ]
  before_action :get_tracers, only: %i[ new edit ]

  # GET /productions or /productions.json
  def index
    @productions = Production.order(:calibration_time).reverse_order.page(params[:page])
  end

  # GET /productions/1 or /productions/1.json
  def show
  end

  # GET /productions/new
  def new
    @production = Production.new
  end

  # GET /productions/1/edit
  def edit
  end

  # POST /productions or /productions.json
  def create
    @production = Production.new(production_params)

    respond_to do |format|
      if @production.save
        format.html { redirect_to @production, notice: "Production was successfully created." }
        format.json { render :show, status: :created, location: @production }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @production.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productions/1 or /productions/1.json
  def update
    respond_to do |format|
      if @production.update(production_params)
        format.html { redirect_to @production, notice: "Production was successfully updated." }
        format.json { render :show, status: :ok, location: @production }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @production.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productions/1 or /productions/1.json
  def destroy
    @production.destroy
    respond_to do |format|
      format.html { redirect_to productions_url, notice: "Production was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def get_tracers
      @tracers = Tracer.order(:name)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_production
      #@production = Production.find(params[:id])
      @production = Production.find_by_id(params[:identifier])
      @production ||= Production.find_by_ref(params[:identifier])
      raise ApplicationController::RoutingError.new('Not found') unless @production
    end

    # Only allow a list of trusted parameters through.
    def production_params
      params.require(:production).permit(:ref, :tracer_id, :client_id, :calibration_time, :calibration_value, :calibration_unit, :description)
    end
end
