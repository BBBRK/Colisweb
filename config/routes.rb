Rails.application.routes.draw do

    namespace :api do
       namespace :v1 do


          resources :transporters

          post '/test', to: 'transporters#test'


        end
    end

end
