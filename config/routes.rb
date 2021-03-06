RisingFalcons::Application.routes.draw do

  root :to => 'Items#home'

  devise_for :users
  resources :users, :only => [:show, :edit, :update]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  devise_for :users, :skip => [:registrations]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :transactions, only: [:new, :create, :show]
  match "/my_transactions", to: "transactions#my_transactions", via: "get"
  match "/reward_points_only", to: "transactions#reward_points_only", via: "get"

  resources :shopping_carts, only: [:show]
  match "/add_to_cart", to: "shopping_carts#add_to_cart", via: "get"
  match "/update_quantity", to: "shopping_carts#update_quantity", via: "post"

  #resources :biddings

  match  '/Emailer/index', to: 'emailers#index' , via: 'get'
  match  '/Emailer/index', to: 'emailers#index' , via: 'post'
  match  '/Emailer/index2', to: 'emailers#index2' , via: 'get'
  match  '/Emailer/index2', to: 'emailers#index2' , via: 'post'

  resources :items, only: [:new, :create, :show]

  match "/about", to: "static_pages#about", via: "get"
  match "/help", to: "static_pages#help", via: "get"
  #match "Item/buy", to: "items#buy", via: "get"

  match "/search", to: "items#search", via: "get"
  match "/search", to: "items#search", via: "post"
  #match "/transactions", to: "transactions#show", via: "get"

  resources :rating_comments, only: [:create]

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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
