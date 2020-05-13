Rails.application.routes.draw do

    namespace :api do
       namespace :v1 do

            resources :transporters
               get '/transporters/:id/carriers', to: 'transporters#get_carriers'



            put '/carrier/:id/trackings', to: 'carriers#tracking'

        end
    end

end
