Rails.application.routes.draw do

  root 'homes#index'
  resources :users, except: [:new]
  get '/register', to: 'users#new'
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'

  namespace :api do
    namespace :v1 do
      # get 'profiles/signin', to: 'profiles#signin'
      # get 'profiles/signup', to: 'profiles#signup'

      resources :profiles do
        # get :me, on: :collection
        get :signin, on: :collection
        get :signup, on: :collection
      end

      resources :genres, only: [:index]
      resources :albums, only: [:show]
      resources :artists, only: [:show]
      resources :playlists, only: [:show]
      resources :tracks, only: [:show]

      get '/artistst', to: 'artistst#tracks'

      get '/search', to: 'search#all'
      get '/search/album', to: 'search#album'
      get '/search/artist', to: 'search#artist'
      get '/search/playlist', to: 'search#playlist'
      get '/search/track', to: 'search#track'

    end
  end

  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    namespace :v1 do
      resources :profiles do
        get :me, on: :collection
      end
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end #