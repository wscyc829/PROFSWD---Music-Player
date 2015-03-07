Rails.application.routes.draw do
  root 'application#index'

  get 'music_player/login' => 'sessions#login_page'
  post 'music_player/login' => 'sessions#login'
  get 'music_player/logout' => 'sessions#logout'

  get 'music_player/register' => 'sessions#register_page'
  post 'music_player/register' => 'sessions#register'

  get 'music_player' => 'music_player#music_player'

  get 'music_player/upload' => 'music_player#upload_page'
  post 'music_player/upload' => 'music_player#upload'
  
  post 'music_player/add_song_to_playlist' => 'music_player#add_song_to_playlist'

  post 'music_player/switch_playlist' => 'music_player#switch_playlist'
  post 'music_player/delete_song' => 'music_player#delete_song'

  post 'music_player/create_new_playlist' => 'music_player#create_new_playlist'

  
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
