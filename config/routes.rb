EnergyAudit::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  devise_for :user, :path_names => { :sign_in => 'login', :sign_out => 'logout'}

  # Public part: view all aggregated data by periods
  resources :periods, :only => [:index, :show], :path => '', :constraints => {:id => /\d{4}-\d{2}/} do
    # Measuring devices
    match 'measuring_devices/:action' => 'auditor/measuring_devices', :via => :get, :as => 'measuring_devices'
    match 'measuring_devices.:format' => 'auditor/measuring_devices#export', :as => 'export_measuring_devices'
    match 'measuring_devices' => redirect{ |params| "/#{params[:period_id]}/measuring_devices/districts" }, :as => nil
    # Audits
    match 'audits/:action' => 'auditor/audits', :via => :get, :as => 'audits'
    match 'audits.:format' => 'auditor/audits#export', :as => 'export_audits'
    match 'audits' => redirect{ |params| "/#{params[:period_id]}/audits/districts" }, :as => nil
    # Activity values
    match 'activity_values/:action' => 'auditor/activity_values', :via => :get, :as => 'activity_values'
    match 'activity_values.:format' => 'auditor/activity_values#export', :as => 'export_activity_values'
    match 'activity_values' => redirect{ |params| "/#{params[:period_id]}/activity_values/districts" }, :as => nil
    # Consumptions
    match 'consumptions/:action' => 'auditor/consumptions', :via => :get, :as => 'consumptions'
    match 'consumptions.:format' => 'auditor/consumptions#export', :as => 'export_consumptions'
    match 'consumptions' => redirect{ |params| "/#{params[:period_id]}/consumptions/districts" }, :as => nil
  end

  namespace :admin do |a|
    resources :users do as_routes end
    resources :operator_subjects do as_routes end
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
    resources :measuring_devices
    resources :measuring_devices_form do
      collection do
        get :edit
        put :update
        delete :destroy
      end
    end
    resources :audits
    resources :activity_values
    resources :consumptions
    # API controller
    resources :activities, :only => [:show]
    root :to => 'dashboard#index'
  end

end
