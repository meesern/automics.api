# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

AutomicsApi::Application.routes.draw do



  # Lifecycle routes for controller "wp_users"
  put 'wp_users/:id/accept_invitation(.:format)' => 'wp_users#do_accept_invitation', :as => 'do_wp_user_accept_invitation'
  get 'wp_users/:id/accept_invitation(.:format)' => 'wp_users#accept_invitation', :as => 'wp_user_accept_invitation'
  put 'wp_users/:id/reset_password(.:format)' => 'wp_users#do_reset_password', :as => 'do_wp_user_reset_password'
  get 'wp_users/:id/reset_password(.:format)' => 'wp_users#reset_password', :as => 'wp_user_reset_password'

  # Resource routes for controller "wp_users"
  get 'wp_users/:id/edit(.:format)' => 'wp_users#edit', :as => 'edit_wp_user'
  get 'wp_users/:id(.:format)' => 'wp_users#show', :as => 'wp_user', :constraints => { :id => %r([^/.?]+) }
  post 'wp_users(.:format)' => 'wp_users#create', :as => 'create_wp_user'
  put 'wp_users/:id(.:format)' => 'wp_users#update', :as => 'update_wp_user', :constraints => { :id => %r([^/.?]+) }
  delete 'wp_users/:id(.:format)' => 'wp_users#destroy', :as => 'destroy_wp_user', :constraints => { :id => %r([^/.?]+) }

  # Show action routes for controller "wp_users"
  get 'wp_users/:id/account(.:format)' => 'wp_users#account', :as => 'wp_user_account'

  # User routes for controller "wp_users"
  match 'wp_user_login(.:format)' => 'wp_users#login', :as => 'wp_user_login'
  get 'wp_user_logout(.:format)' => 'wp_users#logout', :as => 'wp_user_logout'
  match 'wp_user_forgot_password(.:format)' => 'wp_users#forgot_password', :as => 'wp_user_forgot_password'


  # Resource routes for controller "themes"
  get 'themes(.:format)' => 'themes#index', :as => 'themes'
  get 'themes/new(.:format)', :as => 'new_theme'
  get 'themes/:id/edit(.:format)' => 'themes#edit', :as => 'edit_theme'
  get 'themes/:id(.:format)' => 'themes#show', :as => 'theme', :constraints => { :id => %r([^/.?]+) }
  post 'themes(.:format)' => 'themes#create', :as => 'create_theme'
  put 'themes/:id(.:format)' => 'themes#update', :as => 'update_theme', :constraints => { :id => %r([^/.?]+) }
  delete 'themes/:id(.:format)' => 'themes#destroy', :as => 'destroy_theme', :constraints => { :id => %r([^/.?]+) }


  # Resource routes for controller "photos"
  get 'photos(.:format)' => 'photos#index', :as => 'photos'
  get 'photos/new(.:format)', :as => 'new_photo'
  get 'photos/:id/edit(.:format)' => 'photos#edit', :as => 'edit_photo'
  get 'photos/:id(.:format)' => 'photos#show', :as => 'photo', :constraints => { :id => %r([^/.?]+) }
  post 'photos(.:format)' => 'photos#create', :as => 'create_photo'
  put 'photos/:id(.:format)' => 'photos#update', :as => 'update_photo', :constraints => { :id => %r([^/.?]+) }
  delete 'photos/:id(.:format)' => 'photos#destroy', :as => 'destroy_photo', :constraints => { :id => %r([^/.?]+) }


  # Resource routes for controller "comics"
  get 'comics(.:format)' => 'comics#index', :as => 'comics'
  get 'comics/new(.:format)', :as => 'new_comic'
  get 'comics/:id/edit(.:format)' => 'comics#edit', :as => 'edit_comic'
  get 'comics/:id(.:format)' => 'comics#show', :as => 'comic', :constraints => { :id => %r([^/.?]+) }
  post 'comics(.:format)' => 'comics#create', :as => 'create_comic'
  put 'comics/:id(.:format)' => 'comics#update', :as => 'update_comic', :constraints => { :id => %r([^/.?]+) }
  delete 'comics/:id(.:format)' => 'comics#destroy', :as => 'destroy_comic', :constraints => { :id => %r([^/.?]+) }


  # Resource routes for controller "panels"
  get 'panels(.:format)' => 'panels#index', :as => 'panels'
  get 'panels/new(.:format)', :as => 'new_panel'
  get 'panels/:id/edit(.:format)' => 'panels#edit', :as => 'edit_panel'
  get 'panels/:id(.:format)' => 'panels#show', :as => 'panel', :constraints => { :id => %r([^/.?]+) }
  post 'panels(.:format)' => 'panels#create', :as => 'create_panel'
  put 'panels/:id(.:format)' => 'panels#update', :as => 'update_panel', :constraints => { :id => %r([^/.?]+) }
  delete 'panels/:id(.:format)' => 'panels#destroy', :as => 'destroy_panel', :constraints => { :id => %r([^/.?]+) }


  # Resource routes for controller "organisations"
  get 'organisations(.:format)' => 'organisations#index', :as => 'organisations'
  get 'organisations/new(.:format)', :as => 'new_organisation'
  get 'organisations/:id/edit(.:format)' => 'organisations#edit', :as => 'edit_organisation'
  get 'organisations/:id(.:format)' => 'organisations#show', :as => 'organisation', :constraints => { :id => %r([^/.?]+) }
  post 'organisations(.:format)' => 'organisations#create', :as => 'create_organisation'
  put 'organisations/:id(.:format)' => 'organisations#update', :as => 'update_organisation', :constraints => { :id => %r([^/.?]+) }
  delete 'organisations/:id(.:format)' => 'organisations#destroy', :as => 'destroy_organisation', :constraints => { :id => %r([^/.?]+) }


  # Resource routes for controller "placements"
  get 'placements(.:format)' => 'placements#index', :as => 'placements'
  get 'placements/new(.:format)', :as => 'new_placement'
  get 'placements/:id/edit(.:format)' => 'placements#edit', :as => 'edit_placement'
  get 'placements/:id(.:format)' => 'placements#show', :as => 'placement', :constraints => { :id => %r([^/.?]+) }
  post 'placements(.:format)' => 'placements#create', :as => 'create_placement'
  put 'placements/:id(.:format)' => 'placements#update', :as => 'update_placement', :constraints => { :id => %r([^/.?]+) }
  delete 'placements/:id(.:format)' => 'placements#destroy', :as => 'destroy_placement', :constraints => { :id => %r([^/.?]+) }


  # Resource routes for controller "resources"
  get 'resources(.:format)' => 'resources#index', :as => 'resources'
  get 'resources/new(.:format)', :as => 'new_resource'
  get 'resources/:id/edit(.:format)' => 'resources#edit', :as => 'edit_resource'
  get 'resources/:id(.:format)' => 'resources#show', :as => 'resource', :constraints => { :id => %r([^/.?]+) }
  post 'resources(.:format)' => 'resources#create', :as => 'create_resource'
  put 'resources/:id(.:format)' => 'resources#update', :as => 'update_resource', :constraints => { :id => %r([^/.?]+) }
  delete 'resources/:id(.:format)' => 'resources#destroy', :as => 'destroy_resource', :constraints => { :id => %r([^/.?]+) }


  # Resource routes for controller "annotations"
  get 'annotations(.:format)' => 'annotations#index', :as => 'annotations'
  get 'annotations/new(.:format)', :as => 'new_annotation'
  get 'annotations/:id/edit(.:format)' => 'annotations#edit', :as => 'edit_annotation'
  get 'annotations/:id(.:format)' => 'annotations#show', :as => 'annotation', :constraints => { :id => %r([^/.?]+) }
  post 'annotations(.:format)' => 'annotations#create', :as => 'create_annotation'
  put 'annotations/:id(.:format)' => 'annotations#update', :as => 'update_annotation', :constraints => { :id => %r([^/.?]+) }
  delete 'annotations/:id(.:format)' => 'annotations#destroy', :as => 'destroy_annotation', :constraints => { :id => %r([^/.?]+) }

  namespace :admin do


    # Lifecycle routes for controller "admin/wp_users"
    post 'wp_users/invite(.:format)' => 'wp_users#do_invite', :as => 'do_wp_user_invite'
    get 'wp_users/invite(.:format)' => 'wp_users#invite', :as => 'wp_user_invite'

    # Resource routes for controller "admin/wp_users"
    get 'wp_users(.:format)' => 'wp_users#index', :as => 'wp_users'
    get 'wp_users/new(.:format)', :as => 'new_wp_user'
    get 'wp_users/:id/edit(.:format)' => 'wp_users#edit', :as => 'edit_wp_user'
    get 'wp_users/:id(.:format)' => 'wp_users#show', :as => 'wp_user', :constraints => { :id => %r([^/.?]+) }
    post 'wp_users(.:format)' => 'wp_users#create', :as => 'create_wp_user'
    put 'wp_users/:id(.:format)' => 'wp_users#update', :as => 'update_wp_user', :constraints => { :id => %r([^/.?]+) }
    delete 'wp_users/:id(.:format)' => 'wp_users#destroy', :as => 'destroy_wp_user', :constraints => { :id => %r([^/.?]+) }

  end

end
