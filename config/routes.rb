Rails.application.routes.draw do

    root 'api/v1/transporters#index'
    namespace :api do
       namespace :v1 do

            # transporters
            get '/transporters', to: 'transporters#index'
            post '/transporters', to: 'transporters#create'
            get '/transporters/:id/carriers', to: 'transporters#get_carriers'
            get '/transporters/by_postal_codes', to: 'transporters#by_postal_codes'
            get '/transporters/with_carriers_passed_by/:latitude/:longitude', to: 'transporters#by_carriers_passed_by', :constraints => { :latitude => /[^\/]+/, :longitude => /[^\/]+/} #contrainte permettant d'autoriser '.' dans les params de l'url

            # carriers
            put '/carrier/:id/trackings', to: 'carriers#tracking'
            get '/carriers/passed_by/:latitude/:longitude', to: 'carriers#by_coord', :constraints => { :latitude => /[^\/]+/, :longitude => /[^\/]+/} #contrainte permettant d'autoriser '.' dans les params de l'url

        end
    end
end
