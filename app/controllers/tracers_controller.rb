class TracersController < ApplicationController
  before_action :set_tracer, only: %i[ show edit update destroy ]

  # GET /tracers or /tracers.json
  def index
    @tracers = Tracer.all
  end

  # GET /tracers/1 or /tracers/1.json
  def show
  end

  # GET /tracers/new
  def new
    @tracer = Tracer.new
  end

  # GET /tracers/1/edit
  def edit
  end

  # POST /tracers or /tracers.json
  def create
    @tracer = Tracer.new(tracer_params)

    respond_to do |format|
      if @tracer.save
        format.html { redirect_to @tracer, notice: "Tracer was successfully created." }
        format.json { render :show, status: :created, location: @tracer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tracer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracers/1 or /tracers/1.json
  def update
    respond_to do |format|
      if @tracer.update(tracer_params)
        format.html { redirect_to @tracer, notice: "Tracer was successfully updated." }
        format.json { render :show, status: :ok, location: @tracer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tracer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracers/1 or /tracers/1.json
  def destroy
    @tracer.destroy
    respond_to do |format|
      format.html { redirect_to tracers_url, notice: "Tracer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracer
      @tracer = Tracer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tracer_params
      params.require(:tracer).permit(:name, :molecule, :halflife, :color)
    end
end
