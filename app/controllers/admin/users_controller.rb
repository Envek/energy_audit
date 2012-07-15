class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  active_scaffold :user do |conf|
    conf.columns = [:email, :full_name, :password, :password_confirmation]
    conf.list.columns = [:email, :full_name, :admin]
    conf.update.columns = [:email, :full_name, :admin, :password, :password_confirmation]
    conf.create.columns = [:email, :full_name, :admin, :password, :password_confirmation]
    conf.columns[:password].form_ui = :password
    conf.columns[:password_confirmation].form_ui = :password
    conf.nested.add_link(:operator_subjects)
  end
end
