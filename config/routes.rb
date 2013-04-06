Henakut::Application.routes.draw do
  resources :articles

  resources :categories, :except => [:index, :show]
  resources :forums, :except => :index do
    resources :topics, :shallow => true, :except => :index do
      resources :posts, :shallow => true, :except => [:index, :show]
    end
    root :to => 'categories#index', :via => :get
  end
match'/search' => 'pieces#search'
  resources :profiles

  get "orderitems/index"

  get "orderitems/show"

  get "orderitems/new"

  get "orderitems/edit"

  resources :orders

  devise_for :users

  get "cart/index"

  get "site/about"

  get "site/faq"

  get "site/corporateclient"

  get "site/commissionartwork"

  get "site/commissionartworkindex"


  get "site/becomeanartist"

  resources :artists

  resources :pieces

  get "site/index"

  	resources :orders do
  	resources :orderitems
  	end

	devise_for :users do
	resources :orders
	end

	resources :orders do
	resources :orderitems
	end
	

	match '/checkout' => 'cart#createOrder'
  match '/myprofile' => 'profiles#myprofile' 
	match '/index' => 'site#index'
	match '/about' => 'site#about'
	match '/faq' => 'site#faq'
	match '/corporateclient' => 'site#corporateclient'
  match '/commissionartwork' => 'site#commissionartwork'
  match '/commissionartworkindex' => 'site#commissionartworkindex'
  match '/becomeanartist' => 'site#becomeanartist'

	match '/artstyle/:id' => 'pieces#artstyle'
	match '/artmedium/:id' => 'pieces#artmedium'
	match '/artcolour/:id' => 'pieces#artcolour'
	
	
	match '/cart' => 'cart#index'
	match '/cart/:id' => 'cart#add'
	match '/cart/remove/:id' => 'cart#remove'
	match '/clearCart' => 'cart#clearCart'
	match '/checkout' => 'cart#createOrder'

	
	root :to => 'site#index'
	
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
