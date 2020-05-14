class Api::V1::CarriersController < ApplicationController
    skip_before_action :verify_authenticity_token


    #Permet de remplacer les coordonnées d'un carrier
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
            else
                head :bad_request
            end
        else
            head :unauthorized
        end
    end

    #Permet de reccuperer un carrier via ses coordonnées
    def by_coord
        @carriers = Carrier.all.where(latitude: params[:latitude], longitude: params[:longitude])

        if @carriers.present?
            render json: @carriers
        else
            render json: "Aucun carrier trouvé à ces coordonnées"
        end

    end

end
