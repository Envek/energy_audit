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
    # Productions
    match 'productions/:action' => 'auditor/productions', :via => :get, :as => 'productions'
    match 'productions.:format' => 'auditor/productions#export', :as => 'export_productions'
    match 'productions' => redirect{ |params| "/#{params[:period_id]}/productions/districts" }, :as => nil
  end

  # A combined public and operator area
  # Measuring devices
  scope ':period_id/measuring_devices/subjects/:subject_id', :period_id => /\d{4}-\d{2}/, :subject_id => /\d+/ do
    resources :measuring_devices, :controller => 'operator/measuring_devices', :path => '', :except => [:show]
  end
  scope ':period_id/measuring_devices_form/subjects/:subject_id', :period_id => /\d{4}-\d{2}/, :subject_id => /\d+/ do
    resources :measuring_devices_form, :controller => 'operator/measuring_devices_form', :path => '', :except => [:show, :edit, :update, :destroy] do
      collection do
        get :edit
        put :update
        delete :destroy
      end
    end
  end
  # Audits
  scope ':period_id/audits/subjects/:subject_id', :period_id => /\d{4}-\d{2}/, :subject_id => /\d+/ do
    resources :audits, :controller => 'operator/audits', :path => '', :except => [:show]
  end
  # Activity values
  scope ':period_id/activity_values/subjects/:subject_id', :period_id => /\d{4}-\d{2}/, :subject_id => /\d+/ do
    resources :activity_values, :controller => 'operator/activity_values', :path => '', :except => [:show]
  end
  # Consumptions
  scope ':period_id/consumptions/subjects/:subject_id', :period_id => /\d{4}-\d{2}/, :subject_id => /\d+/ do
    resources :consumptions, :controller => 'operator/consumptions', :path => '', :except => [:show]
  end
  # Productions
  scope ':period_id/productions/subjects/:subject_id', :period_id => /\d{4}-\d{2}/, :subject_id => /\d+/ do
    resources :productions, :controller => 'operator/productions', :path => '', :except => [:show]
  end
  # Operator options
  match 'operator/change_period_and_subject' => 'operators#change_period_and_subject', :via => :post
  # API controller
  resources :activities, :only => [:show], :path => 'operator/activities', :module => 'operator'

  # Administration
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
      resources :production_resources do as_routes end
      root :to => redirect('/admin/dictionaries/activities')
    end
    root :to => redirect('/admin/users/operators')
  end

end
