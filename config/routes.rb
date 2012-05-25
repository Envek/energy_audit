EnergyAudit::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  devise_for :admin, :auditor, :operator, :path_names => { :sign_in => 'login', :sign_out => 'logout'}

  namespace :admin do |a|
    namespace :users do |u|
      resources :admins do as_routes end
      resources :auditors do as_routes end
      resources :operators do as_routes end
      resources :operator_subjects do as_routes end
      root :to => redirect('/admin/users/operators')
    end
    namespace :subjects do |s|
      resources :districts do as_routes end
      resources :authorities do as_routes end
      resources :organisations do as_routes end
      root :to => redirect('/admin/subjects/authorities')
    end
    resources :periods do as_routes end
    namespace :dictionaries do |s|
      resources :areas do as_routes end
      resources :kinds do as_routes end
      resources :resources do as_routes end
      resources :activities do as_routes end
      resources :activity_categories do as_routes end
      root :to => redirect('/admin/dictionaries/activities')
    end
    root :to => redirect('/admin/users/operators')
  end

  namespace :operator do
    resources :options
    resources :measuring_devices do
      collection do
        get :edit
        put :update
      end
    end
    resources :audits
    resources :activity_values
    resources :consumptions
  end

  root :to => 'home#index'

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
