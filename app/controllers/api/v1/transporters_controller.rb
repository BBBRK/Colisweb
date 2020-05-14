class Api::V1::TransportersController < ApplicationController

  skip_before_action :verify_authenticity_token
  #before_action :set_transporter, only: [:show, :edit, :update, :destroy]

  def index
    render json: { "Exercice Technique" => "Transporter Organizations Colisweb backend developer exercise", "Poste visé" => "Développeur Back Ruby, Alternance", "Candidat" => "Gressier Jimmy"}
  end

  #Permet la de creation de transporteur, la requete doit absoluement fournir au moins un carrier pour fonctionner, sinon une erreur 400 est renvoyé
  def create
    if params[:key].present? && params[:key] == "THISISAPIKEY"
        if params[:name].present? && params[:siret].present? && params[:postal_codes].present? && params[:carriers].present?

            transp_name = params[:name]
            transp_siret = params[:siret]
            transp_postal_codes = params[:postal_codes]
            @carriers = params[:carriers]
            transp_id = Transporter.last.id + 1

            @carriers.each do |carrier|
                @carrier = Carrier.new(
                    name: carrier[:name],
                    age: carrier[:age],
                    has_driver_licence_a: carrier[:has_driver_licence_a],
                    has_driver_licence_b: carrier[:has_driver_licence_b],
                    has_driver_licence_c: carrier[:has_driver_licence_c],
                    transporter_id: transp_id
                )
                if carrier[:latitude].nil?
                    @carrier.latitude = 0
                else
                    @carrier.latitude = carrier[:latitude]
                end

                if carrier[:longitude].nil?
                    @carrier.longitude = 0
                else
                    @carrier.longitude = carrier[:longitude]
                end

                if carrier[:altitude].nil?
                    @carrier.altitude = 0
                else
                    @carrier.altitude = carrier[:altitude]
                end

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

  #Permet la reccuperation des carriers d'un transporteur
  def get_carriers
      @transporter = Transporter.find(params[:id])

      render json: @transporter.carriers
  end

  #Permet de reccuperer les transporteur triés par code postal
  def by_postal_codes
      @transporters = Transporter.all.order(postal_codes: "ASC")

      render json: @transporters
  end

  #Permet de reccuperer les transporteurs via les coordonnées du carrier
  def by_carriers_passed_by
        @transporters = []
        @carriers = Carrier.where(latitude: params[:latitude], longitude: params[:longitude])

        @carriers.each do |carrier|
            @transporters.push(Transporter.find(carrier.transporter_id))
        end
        @transporters = @transporters.uniq #Supprime les doublons dans l'array

        render json: @transporters
  end

end
