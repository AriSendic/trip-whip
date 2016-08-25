Rails.application.routes.draw do
  get '/' => 'itineraries#index'
  get '/index' => 'itineraries#index'
  # post '/itinerary' => 'itineraries#new'
  # get '/itinerary' => 'itineraries#new'
  get '/itinerary/:id' => 'itineraries#show'
  # get '/itinerary/:id/edit' => 'itineraries#edit'
  # patch '/itinerary/:id' => 'itineraries#update'
  post '/venues' => 'venues#index'
  get '/venues' => 'venues#index'
  post '/venues/show' => 'venues#show'
  get '/venues/show' => 'venues#show'
  post '/itinerary' => 'venues#create'
  post '/restaurants' => 'restaurants#index'
  get '/restaurants' => 'restaurants#index'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'   
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # get '/projects' => 'projects#index'
  # get 'projects/:id' => 'projects#show'
  # get '/projects/:id/edit' => 'projects#edit'

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
