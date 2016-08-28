Rails.application.routes.draw do
  get '/' => 'itineraries#index'
  get '/index' => 'itineraries#index'
  post '/itineraries' => 'itineraries#create'
  # get '/itinerary' => 'itineraries#new'
  get '/itineraries/:id' => 'itineraries#show'
  # get '/itinerary/:id/edit' => 'itineraries#edit'
  # patch '/itinerary/:id' => 'itineraries#update'
  # post '/itineraries/:itinerary_id/venues' => 'venues#index'
  get '/itineraries/:itinerary_id/venues' => 'venues#index'
  post '/itineraries/:itinerary_id/venues' => 'venues#create'
  get '/itineraries/:itinerary_id/venues/:place_id' => 'venues#show'
  
  # post '/itinerary/' => 'venues#create'
  # post '/restaurants' => 'restaurants#index'
  get '/itineraries/:itinerary_id/restaurants' => 'restaurants#index'
  # get '/restaurants' => 'restaurants#index'
  get '/itineraries/:itinerary_id/restaurants/:place_id' => 'restaurants#show'

  post '/itineraries/:itinerary_id/restaurants' => 'restaurants#create'
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
