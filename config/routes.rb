AutomicsApi::Application.routes.draw do
  root :to => 'front#index'

  #Group
  get  '/v1/group'  			=> 'group#index'
  post '/v1/group'  			=> 'group#create'
  get  '/v1/group/:name'  		=> 'group#show'
  post '/v1/group/:name' 		=> 'group#update'
  delete '/v1/group/:name' 		=> 'group#delete'

  #User
  get  '/v1/user'  			=> 'user#index'
  post '/v1/user'  			=> 'user#create'
  get  '/v1/user/:name'  		=> 'user#show'
  post '/v1/user/:name' 		=> 'user#update'
  delete '/v1/user/:name' 		=> 'user#delete'

  #Organisation
  get  '/v1/organisation'  		=> 'organisation#index'
  get  '/v1/organisation/:name'  	=> 'organisation#show'

  #Event
  get  '/v1/organisation/:org/event'  	=> 'event#index'
  get  '/v1/event/:id'                	=> 'event#show'

  #Theme
  get  '/v1/event/:event/theme'  	=> 'theme#index'
  get  '/v1/theme/:id'  		=> 'theme#show'

  #Resource
  get  '/v1/resource/:id'  		=> 'resource#show'

  #Photo
  get  '/v1/photo'  			=> 'photo#index'
  post '/v1/photo/' 			=> 'photo#create'
  get  '/v1/photo/:id'  		=> 'photo#show'
  post '/v1/photo/:id' 			=> 'photo#update'
  delete '/v1/photo/:id' 		=> 'photo#delete'

  #Annotation
  get  '/v1/photo/:id/annotation'  	=> 'annotation#index'
  post '/v1/photo/:id/annotation' 	=> 'annotation#create'
  get  '/v1/annotation/:id'  		=> 'annotation#show'
  post '/v1/annotation/:id' 		=> 'annotation#update'
  delete '/v1/annotation/:id' 		=> 'annotation#delete'

  #Comic
  get  '/v1/comic'  			=> 'comic#index'
  post '/v1/comic'			=> 'comic#create'
  get  '/v1/comic/:id' 			=> 'comic#show'
  post '/v1/comic/:id' 			=> 'comic#update'
  delete '/v1/comic/:id' 		=> 'comic#delete'

  #Panel
  get  '/v1/comic/:id/panel'  		=> 'panel#index'
  post '/v1/comic/:id/panel' 		=> 'panel#create'
  get  '/v1/panel/:id'  		=> 'panel#show'
  post '/v1/panel/:id' 			=> 'panel#update'
  delete '/v1/panel/:id' 		=> 'panel#delete'


  #get '/v1/dish/:dish/person/:person' => 'api#dish', :qualifier=>'person'

  match 'search' => 'front#search', :as => 'site_search'

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
