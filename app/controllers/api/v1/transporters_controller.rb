class Api::V1::TransportersController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :set_transporter, only: [:show, :edit, :update, :destroy]

  # GET /transporters
  # GET /transporters.json
  def index
    @transporters = Transporter.all

    render json: @transporters


  end

  # def test
  #     @transporter = Transporter.new(transporter_params)
  #
  #     if params[:key].present? && params[:key] == "THISISAPIKEY"
  #         puts "OK CHEF"
  #
  #     else
  #         head :unauthorized
  #     end
  #
  #     if @transporter.save
  #         render json: @transporter, status: :created, location: api_v1_article_url(@transporter)
  #     else
  #         render json: @transporter.errors, status: :unprocessable_entity
  #
  #     end
  #
  # end

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

  # POST /transporters
  # POST /transporters.json
  def create


    if params[:key].present? && params[:key] == "THISISAPIKEY"
        if params[:name].present? && params[:siret].present? && params[:postal_codes].present?

            name = params[:name]
            siret = params[:siret]
            postal_codes = params[:postal_codes]

            @transporter = Transporter.new(
                name: name,
                siret: siret,
                postal_codes: postal_codes
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

    # if @transporter.save
    #     render json: @transporter, status: :created, location: api_v1_article_url(@transporter)
    # else
    #     render json: @transporter.errors, status: :unprocessable_entity
    #
    # end
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
