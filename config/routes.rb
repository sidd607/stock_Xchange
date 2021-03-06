Rails.application.routes.draw do
  # resources :portfolios do
  #     patch 'sell' => 'portfolios#sell_post', on: :member
  # end
  resources :transactions
  get 'dashboard' => 'dashboard#index'
  #get "stocks" => 'stocks#show_info'
  resources :stocks do
    get 'nse', on: :collection
  end
  
  resources :stocks do
    member do
      post 'buy' 
    end
  end

  resources :user_stocks, defaults: {format: 'json'} do
    member do
      post 'sell'
    end
  end

  get 'profile' => 'profile#index'
  
  resources :comments
  
  resources :posts
  
  devise_for :users, :controllers => {
    :registrations => 'registrations',
    :omniauth_callbacks =>  'callbacks'
  }, :path => '', :path_names => {
      :sign_in => 'login',
      :sign_up => 'register'
  }

  devise_scope :user do
    get 'logout' => 'devise/sessions#destroy'
    get "social", to: "devise/registrations#social"
  end
  
  resources :authorizations
  
  get "/authorizations", to: "authorizations#index", as: "index"
  
  get "/posts", to: "posts#index", as: "blog"
  
  get "/admin", to: "admin/dashboard#index", as: "admin"
  
  get "main/index"

  resources :posts do
    resources :comments
  end
  
  get 'static_pages/help'

  get 'static_pages/about'
  
  #Add the following line
  #post '/auth/:provider/callback' => 'authentications#create'
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
end
