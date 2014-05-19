CapeMappingMockup::Application.routes.draw do
  namespace :api do
    scope module: :oauth do
      get :authorize, to: 'token#index'
      get '/ask_for_authorize', to: 'token#show', as: 'ask_for_authorize' #this step is only for outside
      get '/token/new/:auth_code', to: 'token#new', as: 'get_auth_code'
      resource :token, only: [:create,:update,:destroy]
    end

    scope module: :v1 do
      resource :user, only: [:create,:show,:update,:destroy] do
        get '/maps', to: 'user#maps', as: :get_maps
      end
      resources :map, only: [:create,:show,:update,:destroy] do
        resources :node, only: [:create,:show,:update,:destroy]
        resources :link, only: [:create,:show,:update,:destroy]
      end
      resources :service, only: [:show]
      namespace :admin do
        resources :service, only: [:create,:show,:update,:destroy]
      end
    end
  end
  get '/map'      , to: 'client#map'     , as: :client_map
  get '/user'     , to: 'client#user'    , as: :client_user
  get '/admin'    , to: 'client#admin'   , as: :client_admin
  get '/admin/services' , to: 'client#services', as: :client_services
  resource :session, only: [:create]
  root to:'client#index'
end
