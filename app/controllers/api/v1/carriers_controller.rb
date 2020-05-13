class Api::V1::CarriersController < ApplicationController
    skip_before_action :verify_authenticity_token



    def tracking
        if params[:key].present? && params[:key] == "THISISAPIKEY"
            if params[:id].present? && params[:latitude].present? && params[:longitude].present? && params[:altitude].present?
                @carrier = Carrier.find(params[:id])
                @carrier.latitude = params[:latitude]
                @carrier.longitude = params[:longitude]
                @carrier.altitude = params[:altitude]

                if @carrier.save!
                    head :ok
                else
                    head :bad_request
                end
                #render json: @carrier
            else
                head :bad_request
            end
        else
            head :unauthorized
        end
    end

    def by_coord
        @carrier = Carrier.where(latitude: params[:latitude], longitude: params[:longitude])

        if @carrier.present?
            render json @carrier
        end

    end

end
