class Api::V1::TransportersController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :set_transporter, only: [:show, :edit, :update, :destroy]

  # GET /transporters
  # GET /transporters.json
  def index
    @transporters = Transporter.all
    render json: @transporters
  end


  # GET /transporters/1
  # GET /transporters/1.json
  def show
  end

  # GET /transporters/new
  def new
    @transporter = Transporter.new
    head :ok
  end

  # GET /transporters/1/edit
  def edit
  end

  #POST /transporters
  #POST /transporters.json
  def create
    if params[:key].present? && params[:key] == "THISISAPIKEY"
        if params[:name].present? && params[:siret].present? && params[:postal_codes].present? && params[:carriers].present?

            transp_name = params[:name]
            transp_siret = params[:siret]
            transp_postal_codes = params[:postal_codes]
            @carriers = params[:carriers]

            @carriers.each do |carrier|
                puts carrier[:name]
                @carrier = Carrier.new(
                    name: carrier[:name],
                    age: carrier[:age],
                    has_driver_licence_a: carrier[:has_driver_licence_a],
                    has_driver_licence_b: carrier[:has_driver_licence_b],
                    has_driver_licence_c: carrier[:has_driver_licence_c]
                )

                if @carrier.save!
                    head :ok
                else
                    head :bad_request
                end
            end

            @transporter = Transporter.new(
                name: transp_name,
                siret: transp_siret,
                postal_codes: transp_postal_codes,
                carriers: @carriers
            )

            if @transporter.save!
                head :ok
            else
                head :bad_request
            end

        else
            head :bad_request
        end

    else
        head :unauthorized
    end
  end

  def get_carriers

      @transporter = Transporter.find(params[:id])

      render json: @transporter.carriers
  end

  def by_postal_codes
      @transporters = Transporter.all.order(postal_codes: "ASC")

      render json: @transporters

  end

  # PATCH/PUT /transporters/1
  # PATCH/PUT /transporters/1.json
  def update
    respond_to do |format|
      if @transporter.update(transporter_params)
        format.html { redirect_to @transporter, notice: 'Transporter was successfully updated.' }
        format.json { render :show, status: :ok, location: @transporter }
      else
        format.html { render :edit }
        format.json { render json: @transporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transporters/1
  # DELETE /transporters/1.json
  def destroy
    @transporter.destroy
    respond_to do |format|
      format.html { redirect_to transporters_url, notice: 'Transporter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transporter
      @transporter = Transporter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transporter_params
      params.require(:transporter).permit(:name)
    end
end
