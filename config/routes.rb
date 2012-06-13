Rickr::Application.routes.draw do
  root :to => "estatico#index"
  match 'login' => 'estatico#login', :as => :login
  
  match 'perfil/editar' => 'usuarios#editar_perfil', :as => :editar_perfil
  match 'perfil(/:nombre_usuario)' => 'estatico#perfil', :as => :perfil
  match 'logout' => 'estatico#logout', :as => :logout
  
  match 'fotos/usuario/:id' => 'fotos#usuario', :as => :fotos_usuario
  match 'albums/usuario/:id' => 'albums#usuario', :as => :albums_usuario
  match 'albums/fotos/:id' => 'albums#fotos', :as => :fotos_del_album
  
  match 'buscar' => 'estatico#buscar', :as => :buscar
  
  match 'autenticar_twitter' => 'estatico#autenticar_twitter', :as => :autenticar_twitter
  match 'autenticacion_twitter_exitosa' => 'estatico#autenticacion_twitter_exitosa', :as => :autenticar_twitter_exito
  match 'revocar_twitter' => 'estatico#revocar_twitter', :as => :revocar_twitter

  resources :albums

  resources :fotos

  resources :usuarios

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
