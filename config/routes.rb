Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api, except: %i[new edit] do
    namespace :v1 do
      post 'sign_in', to: 'user_token#create'
      post 'sign_up', to: 'users#create'

      resources :cities, only: %i[index create] do
        member do
          post 'add_to_favourites', to: 'favourite_cities#create'
          delete 'remove_from_favourites', to: 'favourite_cities#destroy'
        end
      end

      get '/users/:id/favourite_cities', to: 'favourite_cities#index'
    end
  end
end
