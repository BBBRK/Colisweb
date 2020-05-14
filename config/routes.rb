Rails.application.routes.draw do

    namespace :api do
       namespace :v1 do

            #resources :transporters

            get '/transporters', to: 'transporters#index'
            post '/transporters', to: 'transporters#create'
            get '/transporters/:id/carriers', to: 'transporters#get_carriers'
            get '/transporters/by_postal_codes', to: 'transporters#by_postal_codes'

            put '/carrier/:id/trackings', to: 'carriers#tracking'
            #resources :carriers, param: :latitude
                #get '/carrier/passed_by/:latitude/:longitude', to: 'carriers#by_coord'

        end
    end

end
