class CommandesController < ApplicationController
  before_action :set_commande, only: %i[ show edit update destroy ]

  # GET /commandes or /commandes.json
  def index
    @commandes = Commande.order(:date, :client_id, :tracer_id).reverse_order.page(params[:page])
    @units = Production::UNITS.to_a
  end

  # GET /commandes/1 or /commandes/1.json
  def show
  end

  # GET /commandes/new
  def new
    @commande = Commande.new
  end

  # GET /commandes/1/edit
  def edit
  end

  # POST /commandes or /commandes.json
  def create
    @commande = Commande.new(commande_params)

    respond_to do |format|
      if @commande.save
        format.html { redirect_to @commande, notice: "Commande was successfully created." }
        format.json { render :show, status: :created, location: @commande }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @commande.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commandes/1 or /commandes/1.json
  def update
    respond_to do |format|
      if @commande.update(commande_params)
        format.html { redirect_to @commande, notice: "Commande was successfully updated." }
        format.json { render :show, status: :ok, location: @commande }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @commande.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commandes/1 or /commandes/1.json
  def destroy
    @commande.destroy
    respond_to do |format|
      format.html { redirect_to commandes_url, notice: "Commande was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commande
      @commande = Commande.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def commande_params
      params.require(:commande).permit(:tracer_id, :activity_unit_id, :activity, :date, :client_id, :status)
    end
end
