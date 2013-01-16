AutomicsApi::Application.routes.draw do |map|
  # consider reworking with nested shallow routes and prefix
  # scope "/v1" do
  #   map.resources :organisation, :has_many => :themes, :shallow => true
  # end
  # etc.
  
  root :to => 'front#index'

  #Group
  get  '/v1/group'  			=> 'groups#api_index'
  post '/v1/group'  			=> 'groups#api_create'
  get  '/v1/group/:hash'  		=> 'groups#api_show'
  post '/v1/group/:hash'  		=> 'groups#api_update'
  delete '/v1/group/:hash' 		=> 'groups#api_delete'

  #User
  get  '/v1/user'  			=> 'users#api_index'
  post '/v1/user'  			=> 'users#api_create'
  get  '/v1/user/:name'  		=> 'users#api_show'
  post '/v1/user/:name' 		=> 'users#api_update'
  delete '/v1/user/:name' 		=> 'users#api_delete'

  #Organisation
  get  '/v1/organisation'  		=> 'organisations#api_index'
  get  '/v1/organisation/:id'  	        => 'organisations#api_show'

  #Theme
  get  '/v1/organisation/:id/theme'  	=> 'themes#api_index'
  get  '/v1/theme/:id'  		=> 'themes#api_show'

  #Resource
  get  '/v1/theme/:id/resource'  	=> 'resources#api_index'
  get  '/v1/resource/:id'  		=> 'resources#api_show'

  #Photo
  get  '/v1/photo'  			=> 'photos#api_index'
  post '/v1/photo/' 			=> 'photos#api_create'
  get  '/v1/photo/:id'  		=> 'photos#api_show'
  post '/v1/photo/:id' 			=> 'photos#api_update'
  delete '/v1/photo/:id' 		=> 'photos#api_delete'

  #Annotation
  get  '/v1/panel/:panel/annotation'    => 'annotations#api_index'
  post '/v1/panel/:panel/annotation'    => 'annotations#api_create'
  get  '/v1/annotation/:id'  		=> 'annotations#api_show'
  post '/v1/annotation/:id' 		=> 'annotations#api_update'
  delete '/v1/annotation/:id' 		=> 'annotations#api_delete'

  #Comic
  get  '/v1/comic'  			=> 'comics#api_index'
  post '/v1/comic'			=> 'comics#api_create'
  get  '/v1/comic/:id' 			=> 'comics#api_show'
  post '/v1/comic/:id' 			=> 'comics#api_update'
  delete '/v1/comic/:id' 		=> 'comics#api_delete'

  #Panel
  get  '/v1/comic/:id/panel'  		=> 'panels#api_index'
  post '/v1/comic/:id/panel' 		=> 'panels#api_create'
  get  '/v1/panel/:id'  		=> 'panels#api_show'
  post '/v1/panel/:id' 			=> 'panels#api_update'
  delete '/v1/panel/:id' 		=> 'panels#api_delete'

  #Placement
  get  '/v1/panel/:panel/placement'     => 'placements#api_index'
  post '/v1/panel/:panel/resource/:resource/placement'=> 'placements#api_create'
  get  '/v1/placement/:id'  		=> 'placements#api_show'
  post '/v1/placement/:id' 		=> 'placements#api_update'
  delete '/v1/placement/:id' 		=> 'placements#api_delete'

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
